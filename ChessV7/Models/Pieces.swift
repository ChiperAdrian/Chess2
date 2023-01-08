//
//  Pieces.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 29.12.2022.
//

import Foundation

protocol Piece {
    var typeOfPiece: TypeOfPiece {get set}
    var color: PieceColor {get set}
    var image: PieceImage {get set}
    var score: Int {get set}
    
    // The following method takes as input the position of a piece and a chessboard and returns an array with all positions where the piece can move given that position
    func getPossiblePositions(fromPosition: Position, chessboard: Chessboard, playerColor: PieceColor) -> [Position]?
}


enum TypeOfPiece {
    case pawn
    case rook
    case knight
    case bishop
    case king
    case queen
}

struct Position {
    var row: Int
    var col: Int
}

enum PieceColor {
    case black
    case white
}

enum PieceImage: String {
    case p_w = "p_w"
    case p_b = "p_b"
    
    case r_w = "r_w"
    case r_b = "r_b"
    
    case n_w = "n_w"
    case n_b = "n_b"
    
    case b_w = "b_w"
    case b_b = "b_b"
    
    case q_w = "q_w"
    case q_b = "q_b"
    
    case k_w = "k_w"
    case k_b = "k_b"
}
