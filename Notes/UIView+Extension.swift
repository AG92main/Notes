//
//  UIView+ Extension.swift
//  Notes
//
//  Created by Andrey on 13.04.2022.
//

import Foundation
import UIKit

extension UIView {
    func prepareForAutoLayout() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
