//
//  ChessboardView.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 29.12.2022.
//

import SwiftUI

struct ChessboardView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var pause = true


    var body: some View {
        VStack {
            HStack {
                Text(String("30"))
                Text(":")
                Text(String("60"))
            }
            VStack(spacing:0) {
                ForEach(0...7, id:\.self) { row in
                    HStack(spacing:0) {
                        ForEach(0...7, id:\.self) { col in
                            Cell(row: row, col: col).environmentObject(viewModel)
                        }
                    }
                }
            }.cornerRadius(10)
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "flag").font(.title)
                }.foregroundColor(.yellow)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "arrow.uturn.backward").font(.title)
                }
                Button {
                    pause.toggle()
                } label: {
                    Image(systemName: pause ? "arrowtriangle.right.circle" : "pause.circle").font(.title)
                }.padding(.horizontal)
                Button {
                    
                } label: {
                    Image(systemName: "arrow.uturn.forward").font(.title)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "lightbulb").font(.title)
                }.foregroundColor(.yellow)
            }.padding()
        }
    }
}

struct ChessboardView_Previews: PreviewProvider {
    static var previews: some View {
        ChessboardView().environmentObject(ViewModel()).preferredColorScheme(.dark)
    }
}

struct Cell: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var cream = Color(red: 243/255, green: 232/255, blue: 210/255)
    var green = Color(red: 70/255, green: 146/255, blue: 131/255)
    let row: Int
    let col: Int
    
    var body: some View {
        Rectangle()
            .fill(row % 2 == 1 ? (col % 2 == 1 ? cream : green) : (col % 2 == 1 ? green : cream))
            .frame(width:45, height: 45)
            .overlay( Button {
                if viewModel.playersTurn{viewModel.gameLogic.send(Position(row: row, col: col))} 
            } label: {
                viewModel.chessboard.matrix[row][col] != nil ?
                Image(viewModel.chessboard.matrix[row][col]!.image.rawValue)
                    .resizable()
                    .frame(width:
                            viewModel.chessboard.matrix[row][col]!.typeOfPiece == .pawn ||
                           viewModel.chessboard.matrix[row][col]!.typeOfPiece == .rook ? 23 : 35, height:35)
                : nil
            })
            .onTapGesture {
                viewModel.gameLogic.send(Position(row: row, col: col))
            }
    }
}
