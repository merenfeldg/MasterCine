//
//  BaseViewController.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 09/05/26.
//

import UIKit

class UIBaseView: UIView {
    func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
