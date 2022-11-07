//
//  main.swift
//  LadderGame
//
//  Created by ilim on 2022/11/07.
//

import Foundation

print("게임에 참여할 인원수를 입력해주세요(2~8명) : ", terminator: "")
let input = Int(readLine()!)!
if input < 2 || input > 8 {
    print("인원수는 최소 2명, 최대 8명까지 허용됩니다. 프로그램을 종료합니다.")
    exit(0)
}

func printLadder(members: Int, height: Int = 4) {
    var count = 0
    var columns = (0...members - 2).map{ $0 }
    var arr2 : [[Int]] = Array(repeating: Array(repeating: 0, count: members - 1), count: height)
    columns.shuffle()
    while count <= members-2 {
        let row = Int.random(in: 0...3)
        let col = columns.firstIndex(of: columns[count]) ?? -1
        if col == 0 { arr2[row][col] = 1 }
        else {
            if arr2[row][col-1] == 0 {
                arr2[row][col] = 1
            } else { continue }
        }
        count += 1
    }
    for i in 0...3 {
        for j in 0...members - 2 {
            if (j == 0 && arr2[i][j] == 0 && arr2[i][j+1] == 0 && Int.random(in: 1...3) == 2) { arr2[i][j] = 1 }
            else if (j != 0 && j != members - 2 && arr2[i][j] != 1 && arr2[i][j-1] != 1 && arr2[i][j+1] != 1 && Int.random(in: 1...3) == 2) {
                arr2[i][j] = 1
            }
            else if (j == members - 2 && arr2[i][j] == 0 && arr2[i][j-1] == 0 && Int.random(in: 1...3) == 2) { arr2[i][j] = 1 }
        }
    }
    for i in 0...3 {
        for j in 0...members - 2 {
            print("|", terminator: "")
            if arr2[i][j] == 1 { print("-", terminator: "") }
            else { print(" ", terminator: "") }
        }
        print("|")
    }
}

printLadder(members: input)
