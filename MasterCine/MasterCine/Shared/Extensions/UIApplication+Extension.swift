//
//  UIApplication+Extension.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 13/05/26.
//

import UIKit

extension UIApplication {
    static var mc_primaryKeyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first(where: { $0.isKeyWindow })
    }
}
