//
//  URL.swift
//  AERecord
//
//  Created by Sergey on 18.09.2018.
//

import Foundation

extension URL {
    
    static var appSettings: URL? {
        let urlString = [UIApplication.openSettingsURLString, Bundle.main.bundleIdentifier].compactMap({ $0 }).joined()
        return URL(string: urlString)
    }
    
}
