//
//  NewViewController.swift
//  ModalStylesDemo
//
//  Created by Russell Archer on 01/10/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewWillLayoutSubviews() {
        // If we're presented modally with the .fullscreen UIModalPresentationStyle then we must
        // display a dismiss button or the user will have no way to close this view controller.
        // The "Done" button is visible by default
        
        if navigationController != nil {
            // We don't need a dismiss button if we were pushed onto the nav stack,
            // and therefore have a nav bar with back button
            doneButton.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
