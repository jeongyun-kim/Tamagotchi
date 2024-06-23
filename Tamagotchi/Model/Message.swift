//
//  Message.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import Foundation

struct Message {
    let message: String
    static var userName: String = UserDefaultsManager.shared.userName
}

extension Message {
    // User.name이 변경됐을 때 반영되도록 연산 프로퍼티 
    static var list: [Message] {
        return [
                Message(message: "먹어도 먹어도 배가 안 불러용"),
                Message(message: "어이, 나는 짱 쎈 다마고치라구~"),
                Message(message: "\(User.name)님 운동가셔야죵?"),
                Message(message: "\(User.name)님 오늘은 어떠셨나요?"),
                Message(message: "저는 사실 엄청 똑똑해요. 알고계셨나요!"),
                Message(message: "오늘도 힘내세용 \(User.name)님!!"),
                Message(message: "더 주세요~!~!"),
                Message(message: "나는 물먹는 하마"),
                Message(message: "쑥쑥 자라나고 있어용!"),
                Message(message: "졸려요..zz"),
                Message(message: "내일은 어떤 하루가 펼쳐질까요?"),
                Message(message: "이젠 못 먹겠어용..."),
                Message(message: "\(User.name)님은 바부"),
                Message(message: ">ㅅ<"),
                Message(message: "저랑 같이 영화보실래용?"),
                Message(message: "\(User.name)님 오늘 날씨는 어때요?"),
                Message(message: "밥밥밥 밥을 주세용"),
                Message(message: "저는 물이 없으면 주거용.."),
                Message(message: "씐나~!><"),
                Message(message: "응애. 나 아기 다마고치"),
                Message(message: "이래봬도 저는 엄연한 으른이라구요!"),
                Message(message: "저한테는 \(User.name)님밖에 없어용"),
                Message(message: "낮잠자기 좋은 시간이에용"),
                Message(message: "지금 내 안에선 su, su, Su, Supernova~!"),
                Message(message: "저는 걸그룹 노래를 엄청 좋아해용!\n\(User.name)님은용?"),
            ]
    }
}
