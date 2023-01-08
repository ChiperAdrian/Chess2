//
//  Queen.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 30.12.2022.
//

import Foundation

struct Queen: Piece {
    var typeOfPiece: TypeOfPiece
    var color: PieceColor
    var image: PieceImage
    var score: Int = 90
    
    func getPossiblePositions(fromPosition: Position, chessboard: Chessboard, playerColor: PieceColor) -> [Position]? {
        var possiblePositions = [Position]()
        var top:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        var bot:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        var left:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        var right:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        var topLeft:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        var topRight:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        var botLeft:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        var botRight:Position? = Position(row: fromPosition.row, col: fromPosition.col)
        while top != nil || bot != nil || left != nil || right != nil {
            if let currentTop = top, currentTop.row - 1 >= 0 {
                if chessboard.matrix[currentTop.row-1][currentTop.col] != nil {
                    if let piece = chessboard.matrix[currentTop.row-1][currentTop.col] {
                        if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: currentTop.row-1, col:currentTop.col))}
                        top = nil
                    }
                }
                else {
                    possiblePositions.append(Position(row: currentTop.row-1, col: currentTop.col))
                    top!.row -= 1
                }
            }
            else {top = nil}

            if let currentBot = bot, currentBot.row + 1 < 8 {
                if chessboard.matrix[currentBot.row+1][currentBot.col] != nil {
                    if let piece = chessboard.matrix[currentBot.row+1][currentBot.col] {
                        if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: currentBot.row+1, col:currentBot.col))}
                        bot = nil
                    }
                }
                else {
                    possiblePositions.append(Position(row: currentBot.row+1, col: currentBot.col))
                    bot!.row += 1
                }
            }
            else {bot = nil}

            if let currentLeft = left, currentLeft.col - 1 >= 0 {
                if chessboard.matrix[currentLeft.row][currentLeft.col-1] != nil {
                    if let piece = chessboard.matrix[currentLeft.row][currentLeft.col-1] {
                        if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: currentLeft.row, col:currentLeft.col-1))}
                        left = nil
                    }
                }
                else {
                    possiblePositions.append(Position(row: currentLeft.row, col: currentLeft.col-1))
                    left!.col -= 1
                }
            }
            else {left = nil}

            if let currentRight = right, currentRight.col + 1 < 8 {
                if chessboard.matrix[currentRight.row][currentRight.col+1] != nil {
                    if let piece = chessboard.matrix[currentRight.row][currentRight.col+1] {
                        if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: currentRight.row, col:currentRight.col+1))}
                        right = nil
                    }

                }
                else {
                    possiblePositions.append(Position(row: currentRight.row, col: currentRight.col+1))
                    right!.col += 1
                }
            }
            else {right = nil}
        }
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
                        if piece.color == (playerColor == .white ? .black : .white) {possiblePositions.append(Position(row: currentTopRight.row-1, col:currentTopRight.col+1))}
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
                        if piece.color == (playerColor == .white ? .black : .white)  {possiblePositions.append(Position(row: currentBotLeft.row+1, col:currentBotLeft.col-1))}
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
                        if piece.color == (playerColor == .white ? .black : .white) {possiblePositions.append(Position(row: currentBotRight.row+1, col:currentBotRight.col+1))}
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
