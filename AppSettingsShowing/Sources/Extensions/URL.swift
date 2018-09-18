//
//  URL.swift
//  AERecord
//
//  Created by Sergey on 18.09.2018.
//

import Foundation

extension URL {
    
    #if swift(>=4.2)
    static var appSettings: URL? {
        let urlString = [UIApplication.openSettingsURLString, Bundle.main.bundleIdentifier].compactMap({ $0 }).joined()
        return URL(string: urlString)
    }
    #else
    static var appSettings: URL? {
    let urlString = [UIApplicationOpenSettingsURLString, Bundle.main.bundleIdentifier].compactMap({ $0 }).joined()
    return URL(string: urlString)
    }
    #endif
    
}
