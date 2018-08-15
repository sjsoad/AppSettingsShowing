//
//  AppSettingsShowingOutput.swift
//  Pods
//
//  Created by Sergey Kostyan on 28.04.2018.
//
//

import UIKit
import Foundation
import AlertActionBuilder
import SKAlertControllerShowing

public protocol AppSettingsShowing where Self: NSObject {
    
    var appSettingsShowingInterface: AppSettingsShowingInterface? { get }

    func showAppSettingsAlert(with stringsProvider: AppSettingsAlertStringsProviding, alertPresentingCompletion: (() -> Void)?,
                              appSettingsShowingCompletion: ((Bool) -> Void)?)
    
}

public extension AppSettingsShowing {
    
    func showAppSettingsAlert(with stringsProvider: AppSettingsAlertStringsProviding, alertPresentingCompletion: (() -> Void)? = nil,
                              appSettingsShowingCompletion: ((Bool) -> Void)? = nil) {
        let settingsActionConfig = AlertActionConfig(title: stringsProvider.settingsActionTitle,
                                                     style: .default) { [weak self] (_) in
                                                        self?.appSettingsShowingInterface?.showAppSettings(completion: appSettingsShowingCompletion)
        }
        let cancelActionConfig = AlertActionConfig(title: stringsProvider.cancelActionTitle, style: .cancel)
        appSettingsShowingInterface?.showAlertController(with: stringsProvider.settingsAlertTitle, message: stringsProvider.settingsAlertMessage,
                                                         actionsConfiguration: [settingsActionConfig, cancelActionConfig], preferredStyle: .alert,
                                                         completion: alertPresentingCompletion)
    }
    
}
