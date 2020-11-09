//
//  MTApplication.swift
//  MTSDK
//
//  Created by Songoku on 11/9/20.
//

import Foundation
import UIKit

public extension UIApplication {
    //Opens Settings app
    func openSettingsApp() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
}
