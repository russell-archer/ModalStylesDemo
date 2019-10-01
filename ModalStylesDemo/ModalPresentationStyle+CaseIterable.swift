//
//  ModalPresentationStyle+CaseIterable.swift
//  ModalStylesDemo
//
//  Created by Russell Archer on 01/10/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//

import UIKit

extension UIModalPresentationStyle: CaseIterable {
    public static var allCases: [UIModalPresentationStyle] {
        return [.automatic,
                .fullScreen,
                .pageSheet,
                .formSheet,
                .currentContext,
                .custom,
                .overFullScreen,
                .overCurrentContext,
                .popover,
                .none]
    }
    
    public static var allCasesDescrption: [String] {
        return [".automatic",
                ".fullScreen",
                ".pageSheet",
                ".formSheet",
                ".currentContext",
                ".custom",
                ".overFullScreen",
                ".overCurrentContext",
                ".popover",
                ".none"]
    }
}
