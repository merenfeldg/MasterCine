//
//  UserDefaultManager.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//

import Foundation

final class UserDefaultManager {
    static let shared = UserDefaultManager()
    
    private let userDefaults: UserDefaults
    
    private init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func save<T>(_ value: T, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }
    
    func getObject<T>(forKey key: String) -> T? {
        userDefaults.object(forKey: key) as? T
    }
    
    func getString(forKey key: String) -> String? {
        userDefaults.string(forKey: key)
    }
    
    func getBool(forKey key: String) -> Bool {
        userDefaults.bool(forKey: key)
    }
    
    func getInt(forKey key: String) -> Int {
        userDefaults.integer(forKey: key)
    }
    
    func getDouble(forKey key: String) -> Double {
        userDefaults.double(forKey: key)
    }
    
    func contains(key: String) -> Bool {
        userDefaults.object(forKey: key) != nil
    }
    
    func remove(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
    
    func clearAll() {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else { return }
        userDefaults.removePersistentDomain(forName: bundleIdentifier)
    }
}
