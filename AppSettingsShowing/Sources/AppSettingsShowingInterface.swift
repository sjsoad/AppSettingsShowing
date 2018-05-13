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
        guard let settingsAppURL = URL(string: UIApplicationOpenSettingsURLString), UIApplication.shared.canOpenURL(settingsAppURL) else { return }
        UIApplication.shared.open(settingsAppURL, options: [:], completionHandler: completion)
    }
    
}
