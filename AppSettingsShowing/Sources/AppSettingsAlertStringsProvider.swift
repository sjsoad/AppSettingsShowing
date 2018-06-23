//
//  AppSettingsAlertStringsProvider.swift
//  AppSettingsShowing
//
//  Created by Sergey on 31.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

public protocol AppSettingsAlertStringsProviding {
    
    var settingsAlertTitle: String? { get }
    var settingsAlertMessage: String? { get }
    var settingsActionTitle: String { get }
    var cancelActionTitle: String { get }
    
}
open class AppSettingsAlertStringsProvider: AppSettingsAlertStringsProviding {
    
    public private(set) var settingsAlertTitle: String?
    public private(set) var settingsAlertMessage: String?
    public private(set) var settingsActionTitle: String
    public private(set) var cancelActionTitle: String
    
    public init(settingsAlertTitle: String? = nil, settingsAlertMessage: String? = nil, settingsActionTitle: String, cancelActionTitle: String) {
        self.settingsAlertTitle = settingsAlertTitle
        self.settingsAlertMessage = settingsAlertMessage
        self.settingsActionTitle = settingsActionTitle
        self.cancelActionTitle = cancelActionTitle
    }
    
}
