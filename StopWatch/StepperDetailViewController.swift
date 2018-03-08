//
//  StepperDetailViewController.swift
//  StopWatch
//
//  Created by Mauro Sabatino  on 08/03/2018.
//  Copyright © 2018 Mauro Sabatino . All rights reserved.
//

import UIKit

class StepperDetailViewController: UIViewController {

    // MARK: Properties
    
    var step: String!
    
    // MARK: Outlets
    
    
    @IBOutlet weak var label: UILabel!
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.label.text = self.step
        
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }

}
