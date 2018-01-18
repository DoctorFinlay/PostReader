//
//  ModalPostVC.swift
//  PostReader
//
//  Created by Iain Coleman on 18/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import UIKit

class ModalPostVC: UIViewController {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    var passedPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = passedPost!.title
        userNameLbl.text = APIService.instance.usersArray[passedPost!.userId].username
        bodyLbl.text = passedPost!.body
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ModalPostVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)

    }

    @objc func closeTap(_ recogniser:UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
   
    
}
