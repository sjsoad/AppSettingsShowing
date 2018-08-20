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

public protocol AppSettingsShowing {
    
    var appSettingsShowingInterface: AppSettingsShowingInterface? { get }

    func showAppSettingsAlert(with stringsProvider: AppSettingsAlertStringsProviding, alertPresentingCompletion: (() -> Void)?,
                              appSettingsShowingCompletion: ((Bool) -> Void)?)
    func showAppSettings(completion appSettingsShowingCompletion: ((Bool) -> Void)?)
}

public extension AppSettingsShowing where Self: NSObject {
    
    func showAppSettingsAlert(with stringsProvider: AppSettingsAlertStringsProviding, alertPresentingCompletion: (() -> Void)? = nil,
                              appSettingsShowingCompletion: ((Bool) -> Void)? = nil) {
        let settingsActionConfig = AlertActionConfig(title: stringsProvider.settingsActionTitle,
                                                     style: .default) { [weak self] (_) in
                                                        self?.showAppSettings(completion: appSettingsShowingCompletion)
        }
        let cancelActionConfig = AlertActionConfig(title: stringsProvider.cancelActionTitle, style: .cancel)
        appSettingsShowingInterface?.showAlertController(with: stringsProvider.settingsAlertTitle, message: stringsProvider.settingsAlertMessage,
                                                         actionsConfiguration: [settingsActionConfig, cancelActionConfig], preferredStyle: .alert,
                                                         completion: alertPresentingCompletion, popoveConfigurationHandler: nil)
    }
    
    func showAppSettings(completion appSettingsShowingCompletion: ((Bool) -> Void)? = nil) {
        appSettingsShowingInterface?.showAppSettings(completion: appSettingsShowingCompletion)
    }
    
}
