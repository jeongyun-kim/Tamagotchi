//
//  Message.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import Foundation

struct Message {
    let message: String
}

extension Message {
    static let list: [Message] = [
    Message(message: "먹어도 먹어도 배가 안 불러용"),
    Message(message: "어이, 나는 짱 쎈 다마고치라구~"),
    Message(message: "\(User.name)님 운동갈 시간아니에용?"),
    Message(message: "\(User.name)님 오늘은 어떠셨나요?"),
    Message(message: "저는 사실 엄청 똑똑해요. 알고계셨나요!"),
    Message(message: "오늘도 힘내세용 \(User.name)님!!"),
    Message(message: "더 주세요~!~!"),
    Message(message: "나는 하마"),
    Message(message: "쑥쑥 자라나고 있어용!"),
    Message(message: "졸려요..zz"),
    Message(message: "내일은 어떤 하루가 펼쳐질까요?"),
    Message(message: "이젠 못 먹겠어용..."),
    Message(message: "\(User.name)님은 바부"),
    Message(message: ">ㅅ<")
    ]
}
