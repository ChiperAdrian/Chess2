//
//  ViewModel.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 29.12.2022.
//

import Foundation
import Combine
import Dispatch


struct SelectedPiece {
    var piece: Piece
    var position: Position
}


class ViewModel: ObservableObject {
    @Published var chessboard = Chessboard()
    var ai = AI()
    var cancellables = Set<AnyCancellable>()
    var selectedPiece: SelectedPiece?
    var playersTurn = true
    var gameLogic = PassthroughSubject<Position, Never>()
    var bgQueue = DispatchQueue(label: "ai", qos: .userInitiated, attributes: .concurrent)

    init() {
        gameLogic
            .receive(on: bgQueue)
            // Step 1. Pick a piece. First we check if the user clicked on a cell with a white piece case in which we select it and the process stops
            .map { position -> OperatorResult in
                if let piece = self.chessboard.matrix[position.row][position.col], piece.color == .white {
                    self.selectedPiece = SelectedPiece(piece: piece, position: position)
                    return OperatorResult(continueExecution: false)
                }
                return OperatorResult(continueExecution: true, position: position)
            }
            // Step 2. Validate the move. If the user clicked on a cell that doesn't contain a white piece, we validate the move which implies the following checks:
            // - check if a white piece is selected
            // - if it is, check if the cell where the player wants to move the piece corresponds to the cell where the piece can move according to chess rules
            .map({ previousOperatorResult -> OperatorResult in
                // Here we check if we continue executing the operators or not
                guard let position = previousOperatorResult.position else { return OperatorResult(continueExecution: false)}
                // Here we check if we have a piece selected
                guard let selectedPiece = self.selectedPiece else { return OperatorResult(continueExecution: false)}
                // Get the possible positions of the selected piece
                guard let possiblePositions = selectedPiece.piece.getPossiblePositions(fromPosition: selectedPiece.position, chessboard: self.chessboard, playerColor: .white) else {return OperatorResult(continueExecution: false)}
                // After we get the possible positions, we check if the position where the player wants to move is in the possible positions.
                for possiblePosition in possiblePositions {
                    if possiblePosition.row == position.row && possiblePosition.col == position.col {
                        return OperatorResult(continueExecution: true, position: position)
                    }
                }
                return OperatorResult(continueExecution: false)
            })
            .receive(on: DispatchQueue.main)
            // Step 3. Move the piece. If the move is valid, the piece is moved
            .map { previousOperatorResult -> OperatorResult in
                guard let position = previousOperatorResult.position else { return OperatorResult(continueExecution: false)}
                // Once the movement is valid, the player won't be able to move a piece until the AI will move a piece
                self.playersTurn = false
                // Here we modify the chessboard with the move
                self.chessboard.matrix[position.row][position.col] = self.chessboard.matrix[self.selectedPiece!.position.row][self.selectedPiece!.position.col]
                self.chessboard.matrix[self.selectedPiece!.position.row][self.selectedPiece!.position.col] = nil
                self.selectedPiece = nil
                // We return the modified chessboard which will be used by the AI to perform a move
                return OperatorResult(continueExecution: true, chessboard: self.chessboard)
            }
            .receive(on: bgQueue)
            // Step 4. AI move. After the piece is moved, its AI's turn to move
            .map { previousOperatorResult -> Chessboard in
                print(Thread.isMainThread)

                guard let chessboard = previousOperatorResult.chessboard else { return self.chessboard}
                let newState =  self.ai.move(chessboard: chessboard)
                self.playersTurn = true
                return newState
            }
            .receive(on: DispatchQueue.main)
            // Step 5.
            .assign(to: \.chessboard, on:self)
            .store(in: &cancellables)
    }
    

}


struct OperatorResult {
    var continueExecution: Bool
    var position: Position?
    var chessboard: Chessboard?
}

enum PublisherResult {
    case pieceMoved
    case pieceSelected
}
