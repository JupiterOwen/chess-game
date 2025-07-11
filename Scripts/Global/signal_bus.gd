extends Node2D

"""
Emitting signal to the Board.gd whenever a piece is hovered.
Information sent includes: piece_name and the position
Infor will be used to display all possible tiles the chesspiece can reach
"""
signal chessman_hovered(chessman)
signal chessman_unhovered(chessman)
