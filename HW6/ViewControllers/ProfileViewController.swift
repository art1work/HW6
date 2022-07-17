//
//  ProfileViewController.swift
//  HW6
//
//  Created by Артём Ермохин on 06.07.2022.
//

import UIKit



class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imageOutlet: UIImageView! {
        didSet {
            imageOutlet.layer.cornerRadius = imageOutlet.frame.height / 2
        }
    }
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personSurname: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullname
        personName.text = user.person.name
        personSurname.text = user.person.surname
        imageOutlet.image = UIImage(named: user.person.image)
    }
}
