//
//  ViewController.swift
//  PostReader
//
//  Created by Iain Coleman on 18/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var postToPass: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        spinner.isHidden = true
        refreshData()
        
    }
    
    
    func refreshData() {
        
        spinner.startAnimating()
        spinner.isHidden = false
        APIService.instance.getPosts { (success) in
            if success {
                APIService.instance.getUsers(completion: { (success) in
                    if success{
                        self.tableView.reloadData()
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                    }
                })
            }
        }
    }
    
    
    //Table View methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return APIService.instance.postsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        postToPass = APIService.instance.postsArray[indexPath.row]
        
        let destVC = ModalPostVC(nibName: "ModalPostVC", bundle: nil)
        destVC.passedPost = postToPass
        destVC.modalPresentationStyle = .custom
        destVC.modalTransitionStyle = .crossDissolve
        present(destVC, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CELL_CUSTOM) as? CustomCell {
            if indexPath.row % 2 == 1 {
                cell.backgroundColor = UIColor.white
            } else {
                cell.backgroundColor = UIColor.lightGray
            }
            if APIService.instance.postsArray.count > 0 {
                cell.configureCell(post: APIService.instance.postsArray[indexPath.row])
            }
            return cell
        } else {
            return CustomCell()
        }
    }
    
    
    //IBActions
    
    @IBAction func refreshBtnPressed(_ sender: Any) {
        refreshData()
    }
    
    
}

