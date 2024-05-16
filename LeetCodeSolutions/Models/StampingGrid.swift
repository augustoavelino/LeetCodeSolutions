//
//  StampingGrid.swift
//  LeetCodeSolutions
//
//  Created by Augusto Avelino on 15/05/24.
//

import Foundation

class StampingGrid {
    class Solution {
        func possibleToStamp(_ grid: [[Int]], _ stampHeight: Int, _ stampWidth: Int) -> Bool {
            let stampGrid = Grid(grid)
            let stampSize = Size(width: stampWidth, height: stampHeight)
            let isPossible = stampGrid.possibleToStamp(stampSize: stampSize)
            return isPossible
        }
    }
}

// MARK: - Models

extension StampingGrid {
    struct Size {
        let width: Int
        let height: Int
    }
    
    struct Point {
        let x: Int
        let y: Int
    }
    
    struct Tile {
        /// Indicates if the the tile is occupied and a stamp can't be placed.
        /// This does not mean there are stamps in this tile. If `true`, not a single stamp can be placed.
        let isOccupied: Bool
        private(set) var stamps: [Int] = []
        
        var canBeStamped: Bool { !isOccupied }
        var hasNoStamps: Bool { stamps.isEmpty }
        
        mutating func addStamp(_ stamp: Int) {
            stamps.append(stamp)
        }
        
        mutating func removeStamps() {
            stamps.removeAll()
        }
    }
    
    class Grid {
        /// A matrix holding the state of each tile in this grid.
        private(set) var tileGrid: [[Tile]] = []
        var tiles: [Tile] { tileGrid.flatMap({ $0 }) }
        
        var numberOfRows: Int { tileGrid.count }
        var numberOfColumns: Int { tileGrid[0].count }
        
        /// Indicates if it's possible to place stamps on the grid without any unoccupied tile left with no stamps.
        var isPossibleToStamp: Bool {
            !tiles.contains(where: { $0.canBeStamped && $0.hasNoStamps })
        }
        
        /// Creates a new `Grid` from a matrix of `0`s and `1`s.
        /// A `0` represents an empty tile, where it's possible to place a stamp.
        /// A `1` represents an occupied tile, where a stamp can't be placed.
        init(_ grid: [[Int]]) {
            self.tileGrid = grid
                .compactMap { row in row.compactMap { tile in Tile(isOccupied: tile == 1) } }
        }
        
        /// The tile at a given point in the matrix.
        func tile(at point: Point) -> Tile {
            tileGrid[point.y][point.x]
        }
        
        /**
         Indicates whether a stamp with a given size can be placed at a given point.
         - Parameters:
             - point: The origin of the stamp.
             - size: The size of the stamp.
         - Returns: Returns `true` if it's possible to place the stamp, `false` otherwise.
         */
        private func canPlaceStamp(at point: Point, withSize size: Size) -> Bool {
            for row in point.y..<(point.y + size.height) {
                for col in point.x..<(point.x + size.width) {
                    let position = Point(x: col, y: row)
                    let isOccupied = tile(at: position).isOccupied
                    if isOccupied { return false }
                }
            }
            return true
        }
        
        /**
         Places a new stamp in the grid.
         - Parameters:
             - stamp: An `Int` representing the stamp to be placed.
             - point: The origin of the stamp.
             - size: The size of the stamp.
         - Returns: Returns `true` if it's possible to place the stamp, `false` otherwise.
         */
        private func placeStamp(_ stamp: Int, at point: Point, withSize size: Size) {
            for row in point.y..<(point.y + size.height) {
                for col in point.x..<(point.x + size.width) {
                    tileGrid[row][col].addStamp(stamp)
                }
            }
        }
        
        /**
         Iterates through the matrix placing stamp wherever possible.
         - Parameters:
             - stampSize: The size of the stamps being placed.
         */
        func placeStamps(withSize stampSize: Size) {
            guard numberOfRows >= stampSize.height,
                  numberOfColumns >= stampSize.width else { return }
            for row in 0...numberOfRows - stampSize.height {
                for col in 0...numberOfColumns - stampSize.width {
                    let stampOrigin = Point(x: col, y: row)
                    if canPlaceStamp(at: stampOrigin, withSize: stampSize) {
                        placeStamp(row + 1, at: stampOrigin, withSize: stampSize)
                    }
                }
            }
        }
        
        /**
         Removes the stamps from all tiles.
         */
        func removeAllStamps() {
            for row in 0..<numberOfRows {
                for col in 0..<numberOfColumns {
                    tileGrid[row][col].removeStamps()
                }
            }
        }
        
        /**
         Indicates whether it's possible to place stamps with a given size in the grid leaving no empty tile unstamped.
         - Parameters:
             - stampSize: The size of the stamp.
         - Returns: Returns `true` if possible, `false` otherwise.
         */
        func possibleToStamp(stampSize: Size) -> Bool {
            removeAllStamps()
            placeStamps(withSize: stampSize)
            return isPossibleToStamp
        }
    }
}
