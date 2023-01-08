//
//  Knight.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 30.12.2022.
//

import Foundation

struct Knight: Piece {
    var typeOfPiece: TypeOfPiece
    var color: PieceColor
    var image: PieceImage
    var score: Int = 30
    
    func getPossiblePositions(fromPosition: Position, chessboard: Chessboard, playerColor: PieceColor) -> [Position]? {
        var possiblePositions = [Position]()
        
        // Top left 1
        if fromPosition.row - 2 >= 0 && fromPosition.col - 1 >= 0 {
            if let piece = chessboard.matrix[fromPosition.row-2][fromPosition.col-1] {
                if piece.color == (playerColor == .white ? .black : .white) {possiblePositions.append(Position(row: fromPosition.row-2, col: fromPosition.col-1))}
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row-2, col: fromPosition.col-1))
            }
        }
        
        // Top left 2
        if fromPosition.row - 1 >= 0 && fromPosition.col - 2 >= 0 {
            if let piece = chessboard.matrix[fromPosition.row-1][fromPosition.col-2] {
                if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col-2))}
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col-2))
            }
        }
        
        // Top right 1
        if fromPosition.row - 2 >= 0 && fromPosition.col + 1 < 8 {
            if let piece = chessboard.matrix[fromPosition.row-2][fromPosition.col+1] {
                if piece.color == (playerColor == .white ? .black : .white) {possiblePositions.append(Position(row: fromPosition.row-2, col: fromPosition.col+1))}
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row-2, col: fromPosition.col+1))
            }
        }
        
        // Top right 2
        if fromPosition.row - 1 >= 0 && fromPosition.col + 2 < 8 {
            if let piece = chessboard.matrix[fromPosition.row-1][fromPosition.col+2] {
                if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col+2))}
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col+2))
            }
        }
        
        // Bottom left 1
        if fromPosition.row + 2 < 8 && fromPosition.col - 1 >= 0 {
            if let piece = chessboard.matrix[fromPosition.row+2][fromPosition.col-1] {
                if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: fromPosition.row+2, col: fromPosition.col-1))}
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row+2, col: fromPosition.col-1))
            }
        }
        
        // Bottom left 2
        if fromPosition.row + 1 < 8 && fromPosition.col - 2 >= 0 {
            if let piece = chessboard.matrix[fromPosition.row+1][fromPosition.col-2] {
                if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col-2))}
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col-2))
            }
        }
        
        // Bottom right 1
        if fromPosition.row + 2 < 8 && fromPosition.col + 1 < 8 {
            if let piece = chessboard.matrix[fromPosition.row+2][fromPosition.col+1] {
                if piece.color == (playerColor == .white ? .black : .white) {possiblePositions.append(Position(row: fromPosition.row+2, col: fromPosition.col+1))}
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row+2, col: fromPosition.col+1))
            }
        }
        
        // Bottom right 2
        if fromPosition.row + 1 < 8 && fromPosition.col + 2 < 8 {
            if let piece = chessboard.matrix[fromPosition.row+1][fromPosition.col+2] {
                if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col+2))}
            }
            else {
                possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col+2))
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
