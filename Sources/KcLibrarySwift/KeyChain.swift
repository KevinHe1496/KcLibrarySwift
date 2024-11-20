//
//  File.swift
//  KcLibrarySwift
//
//  Created by Kevin Heredia on 20/11/24.
//

import Foundation
import Security
import KeychainSwift

public struct KeyChainKC {
    @discardableResult public func saveKC(key: String, value: String) -> Bool {
        if let data = value.data(using: .utf8) {
            let keychain = KeychainSwift()
            return keychain.set(data, forKey: key)
        } else {
            return false
        }
    }
    public func loadKC(key: String) -> String? {
        let keychain = KeychainSwift()
        if let data = keychain.get(key) {
            return data
        } else {
            return ""
        }
    }
    @discardableResult public func deleteKC(key: String) -> Bool {
        let keychain = KeychainSwift()
        return keychain.delete(key)
    }
}
