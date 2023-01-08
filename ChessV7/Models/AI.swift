//
//  AI.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 29.12.2022.
//

import Foundation

struct RecursionReturnValue {
    var chessboard: Chessboard?
    var score: Int?
    var whiteScore: Int?
    var blackScore: Int?
}

struct AI {
    // The following method receives as input a chessboard, it performs a move of a black piece and it returns the new chessboard resulted after the move
    var positionsEvaluated = 1

    mutating func move(chessboard: Chessboard) -> Chessboard{
        return think4(depth:3, AIsTurn: true, chessboard: chessboard).chessboard ?? chessboard
    }
    func think4(depth: Int, AIsTurn:Bool, chessboard:Chessboard, root:Bool = true) -> RecursionReturnValue {
        if depth == 0 {return RecursionReturnValue(score: chessboard.blackScore - chessboard.whiteScore)}
        var chessboardsResultedAfterMovingAPiece = [Chessboard]()
        for i in 0...7 {
            for j in 0...7 {
                if let piece = chessboard.matrix[i][j], piece.color == (AIsTurn ? .black : .white)  {
                    let possiblePositions = piece.getPossiblePositions(fromPosition: Position(row: i, col: j), chessboard: chessboard, playerColor: AIsTurn ? .black : .white)
                    possiblePositions?.forEach({ possiblePosition in
                        var newChessboard = Chessboard()
                        newChessboard.matrix = chessboard.matrix
                        newChessboard.matrix[possiblePosition.row][possiblePosition.col] = newChessboard.matrix[i][j]
                        newChessboard.matrix[i][j] = nil
                        chessboardsResultedAfterMovingAPiece.append(newChessboard)
                    })
                }
            }
        }
        var bestScore = -99999
        var index = 0
        for i in 0..<chessboardsResultedAfterMovingAPiece.count {
            var res = think4(depth: depth-1, AIsTurn: AIsTurn ? false: true, chessboard: chessboardsResultedAfterMovingAPiece[i], root: false).score!
            if AIsTurn == false {res = res * -1}
            if res > bestScore {
                bestScore = res
                index = i
            }
        }
        if index == 0 {
            var indexes = [0]
            for i in 0..<chessboardsResultedAfterMovingAPiece.count {
                if chessboardsResultedAfterMovingAPiece[i].score == bestScore {
                    indexes.append(i)
                }
            }
            index = indexes[Int.random(in: 0..<indexes.count)]
        }
        return root ? RecursionReturnValue(chessboard: chessboardsResultedAfterMovingAPiece[index])
                    : RecursionReturnValue(score: chessboardsResultedAfterMovingAPiece[index].blackScore - chessboardsResultedAfterMovingAPiece[index].whiteScore)
    }
}




// The methods from each piece computes an array that contains all cells where the piece can go. Then, it checks whether the cell that the player wants to move a piece in is in the array with all cells where the piece can go and if it is, it returns true. If its not, it returns false. In this algorithm, we need that array with all possible cells, and then we create new chessboards with the current piece moved in all that cells and with the black score modified accordingly. These chessboards are appended to chessboardsResultedAfterMovingAPiece and then they are passed to children in recursion.
