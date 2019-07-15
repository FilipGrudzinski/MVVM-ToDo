//
//  BundleExtension.swift
//  MVVM-ToDo
//
//  Created by Filip on 13/07/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation

extension Bundle {
    static func loadNib<T>(_ owner: T) {
        main.loadNibNamed(String(describing: type(of: owner)), owner: owner, options: nil)
    }
}

