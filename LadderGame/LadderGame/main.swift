//
//  main.swift
//  LadderGame
//
//  Created by ilim on 2022/11/07.
//

import Foundation

print("게임에 참여할 인원수를 입력해주세요(2~8명) : ", terminator: "")
let members = Int(readLine()!)!
if members < 2 || members > 8 {
    print("인원수는 최소 2명, 최대 8명까지 허용됩니다. 프로그램을 종료합니다.")
    exit(0)
}
