//
//  Pawn.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 29.12.2022.
//

import Foundation

struct Pawn: Piece {
    var typeOfPiece: TypeOfPiece
    var color: PieceColor
    var image: PieceImage
    var score: Int = 10
    
//    func validateMove(fromPosition: Position, toPosition: Position, chessboard: Chessboard) -> Bool {
//        if toPosition.row == fromPosition.row - 1 {
//            if toPosition.col == fromPosition.col {
//                if chessboard.matrix[toPosition.row][toPosition.col] != nil { return false}
//                return true
//            }
//            else if toPosition.col == fromPosition.col - 1 || toPosition.col == fromPosition.col + 1 {
//                if let piece = chessboard.matrix[toPosition.row][toPosition.col], piece.color == .black {
//                    return true
//                }
//            }
//        }
//        return false
//    }
    
    func getPossiblePositions(fromPosition: Position, chessboard: Chessboard, playerColor: PieceColor) -> [Position]? {
        var possiblePositions: [Position] = [Position]()
        
        if playerColor == .white {
            if fromPosition.row - 1 >= 0 && chessboard.matrix[fromPosition.row-1][fromPosition.col] == nil {
                possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col))
            }
            if fromPosition.row - 1 >= 0 && fromPosition.col - 1 >= 0 {
                if let piece = chessboard.matrix[fromPosition.row-1][fromPosition.col-1], piece.color == .black {
                    possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col-1))
                }
            }
            if fromPosition.row - 1 >= 0 && fromPosition.col + 1 < 8 {
                if let piece = chessboard.matrix[fromPosition.row-1][fromPosition.col+1], piece.color == .black {
                    possiblePositions.append(Position(row: fromPosition.row-1, col: fromPosition.col+1))
                }
            }
        }
        
        else {
            if fromPosition.row + 1 < 8 && chessboard.matrix[fromPosition.row+1][fromPosition.col] == nil {
                possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col))
            }
            if fromPosition.row + 1 < 8 && fromPosition.col - 1 >= 0 {
                if let piece = chessboard.matrix[fromPosition.row+1][fromPosition.col-1], piece.color == .white {
                    possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col-1))
                }
            }
            if fromPosition.row + 1 < 8 && fromPosition.col + 1 < 8 {
                if let piece = chessboard.matrix[fromPosition.row+1][fromPosition.col+1], piece.color == .white {
                    possiblePositions.append(Position(row: fromPosition.row+1, col: fromPosition.col+1))
                }
            }
        }
        

        return possiblePositions.count > 0 ? possiblePositions : nil
    }
}
