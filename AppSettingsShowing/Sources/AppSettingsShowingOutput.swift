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


public protocol AppSettingsShowingOutput {

    var appSettingsShowingInterface: AppSettingsShowingInterface? { get }
    
    var settingsActionTitle: String? { get }
    var cancelActionTitle: String? { get }
    var settingsAlertTitle: String? { get }
    var settingsAlertMessage: String? { get }
    
    func showAppSettingsAlert(alertPresentingCompletion: (() -> Void)?, appSettingsShowingCompletion: ((Bool) -> Void)?)
    
}

extension AppSettingsShowingOutput where Self: NSObject {

    public func showAppSettingsAlert(alertPresentingCompletion: (() -> Void)? = nil, appSettingsShowingCompletion: ((Bool) -> Void)? = nil) {
        let settingsActionConfig = AlertActionConfig(title: settingsActionTitle,
                                                     style: .default) { [weak self] (_) in
            self?.appSettingsShowingInterface?.showAppSettings(completion: appSettingsShowingCompletion)
        }
        let cancelActionConfig = AlertActionConfig(title: cancelActionTitle, style: .cancel)
        appSettingsShowingInterface?.showAlertController(with: settingsAlertTitle, message: settingsAlertMessage,
                                                         actionsConfiguration: [settingsActionConfig, cancelActionConfig],
                                                         preferredStyle: .alert, completion: alertPresentingCompletion)
    }
    
}
