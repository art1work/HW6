//
//  InfoViewController.swift
//  HW6
//
//  Created by Артём Ермохин on 06.07.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var infoText: UITextView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoText.text = user.person.infoText
    }

}
