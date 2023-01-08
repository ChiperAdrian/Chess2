//
//  Bishop.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 30.12.2022.
//

import Foundation

struct Bishop: Piece {
    var typeOfPiece: TypeOfPiece
    var color: PieceColor
    var image: PieceImage
    var score: Int = 30
    
    func getPossiblePositions(fromPosition: Position, chessboard: Chessboard, playerColor: PieceColor) -> [Position]? {
        var possiblePositions = [Position]()
        var topLeft:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        var topRight:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        var botLeft:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        var botRight:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        while topLeft != nil || topRight != nil || botLeft != nil || botRight != nil {
            if let currentTopLeft = topLeft, currentTopLeft.row - 1 >= 0, currentTopLeft.col - 1 >= 0 {
                if chessboard.matrix[currentTopLeft.row-1][currentTopLeft.col-1] != nil {
                    if let piece = chessboard.matrix[currentTopLeft.row-1][currentTopLeft.col-1] {
                        if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: currentTopLeft.row-1, col:currentTopLeft.col-1))}
                        topLeft = nil
                    }
                }
                else {
                    possiblePositions.append(Position(row: currentTopLeft.row-1, col: currentTopLeft.col-1))
                    topLeft!.row -= 1
                    topLeft!.col -= 1
                }
            }
            else {topLeft = nil}

            if let currentTopRight = topRight, currentTopRight.row - 1 >= 0, currentTopRight.col + 1 < 8 {
                if chessboard.matrix[currentTopRight.row-1][currentTopRight.col+1] != nil {
                    if let piece = chessboard.matrix[currentTopRight.row-1][currentTopRight.col+1] {
                        if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: currentTopRight.row-1, col:currentTopRight.col+1))}
                        topRight = nil
                    }
                }
                else {
                    possiblePositions.append(Position(row: currentTopRight.row-1, col: currentTopRight.col+1))
                    topRight!.row -= 1
                    topRight!.col += 1
                }
            }
            else {topRight = nil}

            if let currentBotLeft = botLeft, currentBotLeft.row + 1 < 8, currentBotLeft.col - 1 >= 0 {
                if chessboard.matrix[currentBotLeft.row+1][currentBotLeft.col-1] != nil {
                    if let piece = chessboard.matrix[currentBotLeft.row+1][currentBotLeft.col-1] {
                        if piece.color == (playerColor == .white ? .black : .white) {possiblePositions.append(Position(row: currentBotLeft.row+1, col:currentBotLeft.col-1))}
                        botLeft = nil
                    }
                }
                else {
                    possiblePositions.append(Position(row: currentBotLeft.row+1, col: currentBotLeft.col-1))
                    botLeft!.row += 1
                    botLeft!.col -= 1
                }
            }
            else {botLeft = nil}

            if let currentBotRight = botRight, currentBotRight.row+1 < 8, currentBotRight.col + 1 < 8 {
                if chessboard.matrix[currentBotRight.row+1][currentBotRight.col+1] != nil {
                    if let piece = chessboard.matrix[currentBotRight.row+1][currentBotRight.col+1] {
                        if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: currentBotRight.row+1, col:currentBotRight.col+1))}
                        botRight = nil
                    }

                }
                else {
                    possiblePositions.append(Position(row: currentBotRight.row+1, col: currentBotRight.col+1))
                    botRight!.row += 1
                    botRight!.col += 1
                }
            }
            else {botRight = nil}
        }
        return possiblePositions.count > 0 ? possiblePositions : nil
//        for position in possiblePositions {
//            if position.row == toPosition.row && position.col == toPosition.col {
//                return true
//            }
//        }
//        return false
    }
}
