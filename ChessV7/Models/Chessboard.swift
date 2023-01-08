//
//  Chessboard.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 29.12.2022.
//

import Foundation

struct Chessboard {
    var matrix = [[Piece?]](repeating: [Piece?](repeating: nil, count: 8), count: 8)
    var whiteScore: Int {
        get {
            var score = 0
            for i in 0...7 {
                for j in 0...7 {
                    if let piece = matrix[i][j], piece.color == .white {
                        score += piece.score
                    }
                }
            }
            return score
        }
    }
    var blackScore: Int {
        get {
            var score = 0
            for i in 0...7 {
                for j in 0...7 {
                    if let piece = matrix[i][j], piece.color == .black {
                        score += piece.score
                    }
                }
            }
            return score
        }
    }
    var score: Int {
        get {
            var sum = 0
            for i in 0...7 {
                for j in 0...7 {
                    if let piece = matrix[i][j] {
                        sum += piece.color == .black ? piece.score : -piece.score
                    }
                }
            }
            return sum
        }
    }
    init() {
        matrix[0][0] = Rook(typeOfPiece: .rook, color: .black, image: .r_b)
        matrix[0][7] = Rook(typeOfPiece: .rook, color: .black, image: .r_b)
        
        matrix[0][1] = Knight(typeOfPiece: .knight, color: .black, image: .n_b)
        matrix[0][6] = Knight(typeOfPiece: .knight, color: .black, image: .n_b)
        
        matrix[0][2] = Bishop(typeOfPiece: .bishop, color: .black, image: .b_b)
        matrix[0][5] = Bishop(typeOfPiece: .bishop, color: .black, image: .b_b)
        
        matrix[0][3] = King(typeOfPiece: .king, color: .black, image: .k_b)
        matrix[0][4] = Queen(typeOfPiece: .queen, color: .black, image: .q_b)
        
        for col in 0...7 {
            matrix[1][col] = Pawn(typeOfPiece: .pawn, color: .black, image: .p_b)
            matrix[6][col] = Pawn(typeOfPiece: .pawn, color: .white, image: .p_w)
        }
        
        matrix[7][0] = Rook(typeOfPiece: .rook, color: .white, image: .r_w)
        matrix[7][7] = Rook(typeOfPiece: .rook, color: .white, image: .r_w)
        
        matrix[7][1] = Knight(typeOfPiece: .knight, color: .white, image: .n_w)
        matrix[7][6] = Knight(typeOfPiece: .knight, color: .white, image: .n_w)
        
        matrix[7][2] = Bishop(typeOfPiece: .bishop, color: .white, image: .b_w)
        matrix[7][5] = Bishop(typeOfPiece: .bishop, color: .white, image: .b_w)
        
        matrix[7][3] = King(typeOfPiece: .king, color: .white, image: .k_w)
        matrix[7][4] = Queen(typeOfPiece: .queen, color: .white, image: .q_w)
    }
}
