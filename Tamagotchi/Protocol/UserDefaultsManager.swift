//
//  UserDefaultsManager.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import Foundation

class UserDefaultsManager {
    private init() {}
    static let shared = UserDefaultsManager()
    let standard = UserDefaults.standard
    
    var userName: String {
        get {
            standard.string(forKey: "userName") ?? "대장"
        }
        set{
            standard.setValue(newValue, forKey: "userName")
        }
    }
    
    var selectedTamagotchiRawValue: Int {
        get {
            standard.integer(forKey: "selectedTamagotchiIdx")
        }
        set{
            standard.setValue("\(newValue)", forKey: "selectedTamagotchiIdx")
        }
    }
    
    var food: Int {
        get {
            standard.integer(forKey: "food")
        }
        set{
            standard.setValue(newValue, forKey: "food")
        }
    }
    
    var water: Int {
        get {
            standard.integer(forKey: "water")
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "water")
        }
    }
    
    func deleteAllDatas() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
        print(UserDefaults.standard.dictionaryRepresentation())
    }
}
