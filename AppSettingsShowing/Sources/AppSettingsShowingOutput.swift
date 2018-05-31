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

public protocol AppSettingsAlertStringsProviding {
    
    var settingsAlertTitle: String? { get }
    var settingsAlertMessage: String? { get }
    var settingsActionTitle: String { get }
    var cancelActionTitle: String { get }
    
}
open class AppSettingsAlertStringsProvider: AppSettingsAlertStringsProviding {
    
    public var settingsAlertTitle: String?
    public var settingsAlertMessage: String?
    public var settingsActionTitle: String
    public var cancelActionTitle: String
    
    public init(settingsAlertTitle: String? = nil, settingsAlertMessage: String? = nil, settingsActionTitle: String, cancelActionTitle: String) {
        self.settingsAlertTitle = settingsAlertTitle
        self.settingsAlertMessage = settingsAlertMessage
        self.settingsActionTitle = settingsActionTitle
        self.cancelActionTitle = cancelActionTitle
    }
    
}

public protocol AppSettingsShowing {
    
    var appSettingsShowingInterface: AppSettingsShowingInterface? { get }

    func showAppSettingsAlert(with stringsProvider: AppSettingsAlertStringsProviding, alertPresentingCompletion: (() -> Void)?,
                              appSettingsShowingCompletion: ((Bool) -> Void)?)
    
}

public extension AppSettingsShowing where Self: NSObject {
    
    func showAppSettingsAlert(with stringsProvider: AppSettingsAlertStringsProviding, alertPresentingCompletion: (() -> Void)? = nil,
                              appSettingsShowingCompletion: ((Bool) -> Void)? = nil) {
        let settingsActionConfig = AlertActionConfig(title: stringsProvider.settingsActionTitle,
                                                     style: .default) { [weak self] (_) in
                                                        self?.appSettingsShowingInterface?.showAppSettings(completion: appSettingsShowingCompletion)
        }
        let cancelActionConfig = AlertActionConfig(title: stringsProvider.cancelActionTitle, style: .cancel)
        appSettingsShowingInterface?.showAlertController(with: stringsProvider.settingsAlertTitle, message: stringsProvider.settingsAlertMessage,
                                                         actionsConfiguration: [settingsActionConfig, cancelActionConfig],
                                                         preferredStyle: .alert, completion: alertPresentingCompletion)
    }
    
}
