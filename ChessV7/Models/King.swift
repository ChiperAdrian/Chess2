//
//  King.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 30.12.2022.
//

import Foundation

struct King: Piece {
    var typeOfPiece: TypeOfPiece
    var color: PieceColor
    var image: PieceImage
    var score: Int = 900
    
    func getPossiblePositions(fromPosition: Position, chessboard: Chessboard, playerColor: PieceColor) -> [Position]? {
        var possiblePositions = [Position]()
        
        // Moving Top
        if fromPosition.row - 1 >= 0 {
            if let piece = chessboard.matrix[fromPosition.row-1][fromPosition.col] {
                if piece.color == (playerColor == .white ? .black : .white) {
                    possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col))
                }
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col))
            }
        }
        
        // Moving Bot
        if fromPosition.row + 1 < 8 {
            if let piece = chessboard.matrix[fromPosition.row+1][fromPosition.col] {
                if piece.color == (playerColor == .white ? .black : .white)  {
                    possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col))
                }
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col))
            }
        }

        // Moving Left
        if fromPosition.col-1 >= 0 {
            if let piece = chessboard.matrix[fromPosition.row][fromPosition.col-1] {
                if piece.color == (playerColor == .white ? .black : .white)  {
                    possiblePositions.append(Position(row: fromPosition.row, col: fromPosition.col-1))
                }
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row, col: fromPosition.col-1))
            }
        }

        // Moving Right
        if fromPosition.col+1 >= 0 {
            if let piece = chessboard.matrix[fromPosition.row][fromPosition.col+1] {
                if piece.color == (playerColor == .white ? .black : .white)  {
                    possiblePositions.append(Position(row: fromPosition.row, col: fromPosition.col+1))
                }
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row, col: fromPosition.col+1))
            }
        }

        // Moving TopLeftCorner
        if fromPosition.row-1 >= 0 && fromPosition.col-1 >= 0 {
            if let piece = chessboard.matrix[fromPosition.row-1][fromPosition.col-1]  {
                if piece.color == (playerColor == .white ? .black : .white)  {
                    possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col-1))
                }
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col-1))
            }
        }

        // Moving TopRightCorner
        if  fromPosition.row-1 >= 0 && fromPosition.col+1 < 8 {
            if let piece = chessboard.matrix[fromPosition.row-1][fromPosition.col+1] {
                if piece.color == (playerColor == .white ? .black : .white) {
                    possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col+1))
                }
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col+1))
            }
        }

        // Moving BotLeftCorner
        if fromPosition.row+1 < 8 && fromPosition.col-1 >= 0 {
            if let piece = chessboard.matrix[fromPosition.row+1][fromPosition.col-1] {
                if piece.color == (playerColor == .white ? .black : .white)  {
                    possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col-1))
                }
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col-1))
            }
        }

        // Moving BotRightCorner
        if fromPosition.row+1 < 8 && fromPosition.col+1 < 8 {
            if let piece = chessboard.matrix[fromPosition.row+1][fromPosition.col+1] {
                if piece.color == (playerColor == .white ? .black : .white)  {
                    possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col+1))
                }
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col+1))
            }
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
