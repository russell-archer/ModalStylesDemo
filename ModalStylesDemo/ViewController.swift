//
//  ViewController.swift
//  ModalStylesDemo
//
//  Created by Russell Archer on 30/09/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var modalPresentationStylePicker: UIPickerView!
    
    fileprivate var selectedPresentationStyle: UIModalPresentationStyle = .automatic
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStylePicker.delegate = self
        modalPresentationStylePicker.dataSource = self
    }
    
    /*
     
     presentViewController vs pushViewController
     -------------------------------------------
     
     presentViewController:
     
         * The new view controller is presented MODALLY
         * The new view controller is NOT added to the existing navigation stack (it's not contained by the nav controller)
         * You DO NOT get a navigation bar and back button
         * modalPresentationStyle == .automatic:
     
            * Presents the new view controller on top of the current view controller
            * The top of current view controller can be seen “underneath” the new view controller
            * The user can dismiss the new view controller by dragging down
            * As it's not part of the navigation stack, there is no navigation bar
     
         * modalPresentationStyle == .fullscreen:
     
            * Presents the new view controller on top of the current view controller
            * The current view controller CANNOT be seen underneath the new view controller
            * There is no way for the user dismiss the new view controller
            * As it's not part of the navigation stack, there is no navigation bar (the user is "stuck")
            * New view controller should provide a "Done" button to allow user to dismiss it
     
     pushViewController:
     
         * Pushes the new view controller onto the EXISTING navigation stack
         * The new vc is NOT presented modally
         * The new view controller is always presented full screen (it's indepedent of modalPresentationStyle)
         * You automatically get a navigation bar and back button
          
     */
    
    @IBAction func pushViewControllerTapped(_ sender: Any) {
        guard let nvc = storyboard?.instantiateViewController(withIdentifier: "NewViewController") else { return }
        navigationController?.pushViewController(nvc, animated: true)
    }
    
    @IBAction func presentViewControllerTapped(_ sender: Any) {
        guard let nvc = storyboard?.instantiateViewController(withIdentifier: "NewViewController") else { return }
        nvc.modalPresentationStyle = selectedPresentationStyle
        navigationController?.present(nvc, animated: true, completion: nil)
        
//        let nvc = NewViewController()
//        nvc.modalPresentationStyle = selectedPresentationStyle
//        navigationController?.present(nvc, animated: true)
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UIModalPresentationStyle.allCasesDescrption[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPresentationStyle = UIModalPresentationStyle.allCases[row]
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        UIModalPresentationStyle.allCases.count
    }
}

 

