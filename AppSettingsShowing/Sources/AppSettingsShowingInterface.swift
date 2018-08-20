//
//  AppSettingsShowingInterface.swift
//  Pods
//
//  Created by Sergey Kostyan on 28.04.2018.
//
//

import UIKit
import Foundation
import SKAlertControllerShowing

public protocol AppSettingsShowingInterface: AlertControllerShowingInterface {

    func showAppSettings(completion: ((Bool) -> Void)?)
    
}

public extension AppSettingsShowingInterface {

    func showAppSettings(completion: ((Bool) -> Void)? = nil) {
        guard let myAppSettingsURL = myAppSettingsURL, UIApplication.shared.canOpenURL(myAppSettingsURL) else {
            completion?(false)
            return }
        UIApplication.shared.open(myAppSettingsURL, options: [:], completionHandler: completion)
    }
    
    // MARK: - Private -
    
    private var myAppSettingsURL: URL? {
        let urlString = [UIApplicationOpenSettingsURLString, Bundle.main.bundleIdentifier].compactMap({ $0 }).joined()
        return URL(string: urlString)
    }
    
}
