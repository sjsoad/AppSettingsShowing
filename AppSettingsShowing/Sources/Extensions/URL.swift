//
//  URL.swift
//  AERecord
//
//  Created by Sergey on 18.09.2018.
//

import Foundation

extension URL {
    
    static var appSettings: URL? {
        #if swift(>=4.2)
        let urlString = [UIApplication.openSettingsURLString, Bundle.main.bundleIdentifier].compactMap({ $0 }).joined()
        #else
        let urlString = [UIApplicationOpenSettingsURLString, Bundle.main.bundleIdentifier].compactMap({ $0 }).joined()
        #endif
        return URL(string: urlString)
    }
}
