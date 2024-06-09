//
//  UserDefaultsManager.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import Foundation

struct UserDefaultsManager {
    var userName: String {
        get {
            UserDefaults.standard.string(forKey: "userName") ?? "대장"
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "userName")
        }
    }
    
    var selectedTamagotchiRawValue: Int {
        get {
            return UserDefaults.standard.integer(forKey: "selectedTamagotchiIdx")
        }
        set{
            UserDefaults.standard.setValue("\(newValue)", forKey: "selectedTamagotchiIdx")
        }
    }
    
    var food: Int {
        get {
            UserDefaults.standard.integer(forKey: "food")
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "food")
        }
    }
    
    var water: Int {
        get {
            UserDefaults.standard.integer(forKey: "water")
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "water")
        }
    }
}
