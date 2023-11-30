//
//  UserDefaultsGroup.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/30.
//

import Foundation

extension UserDefaults {
    // 타입 연산 프로퍼티 사용해서 AppGroups에서 사용할 수 있게 구성
    static var groupShared: UserDefaults {
        let appGroupID = "group.sesac.coin" //❗️ String 실수 하지 않기
        
        // suiteName 생성하게 되면 group.sesac.coin로 저장한 App Group에 접근하여 앱 그룹에서 사용하겠다.
        return UserDefaults(suiteName: appGroupID)!
    }
}
