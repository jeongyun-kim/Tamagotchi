//
//  enums
//  Tamagotchi
//
//  Created by 김정윤 on 6/9/24.
//

import Foundation

enum MainViewType: String {
    case select = "다마고치 선택하기"
    case change = "다마고치 변경하기"
}

enum PopupViewType: String {
    case select = "시작하기"
    case change = "변경하기"
}

enum ButtonImageType: String {
    case food = "drop.circle"
    case water = "leaf.circle"
    case userNameChange = "pencil"
    case tamagotchiChange = "moon.fill"
    case reset = "arrow.clockwise"
    case setting = "person.circle.fill"
}


enum ButtonTitle: String {
    case foodBtnTitle = "밥먹기"
    case waterBtnTitle = "물먹기"
    case cancel = "취소하기"
}

enum ImageView: String {
    case bubble = "bubble"
}

enum Placeholder: String {
    case foodTextField = "밥주세용"
    case waterTextField = "물주세용"
    case nameTextField = "대장님 이름을 알려주세요!"
}

enum ToastMessage: String {
    case foodToast = "밥은 한 번에 99개까지만 먹을 수 있어용"
    case waterToast = "물은 한 번에 49방울까지만 먹을 수 있어용"
    case nameToast = "닉네임은 2글자 이상 입력해주세용 :) "
}

enum AlertActionTitle: String {
    case confirm = "확인"
    case cancel = "취소"
}
