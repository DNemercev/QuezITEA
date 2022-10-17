//
//  ListOfTestsViewController.swift
//  Quse
//
//  Created by Nemercev Dmytro on 14.10.2022.
//

import UIKit

class ListOfTestsViewController: UIViewController {
    
    
    @IBOutlet weak var listOfTestsTableView: UITableView!
    override func viewDidLoad() {
        
        listOfTestsTableView.delegate = self
        listOfTestsTableView.dataSource = self
        
        listOfTestsTableView.register(UINib(nibName: "ListOfTestsTableViewCell", bundle: nil), forCellReuseIdentifier: "ListOfTestsTableViewCell")
        super.viewDidLoad()
    }
}

extension ListOfTestsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = listOfTestsTableView.dequeueReusableCell(withIdentifier: "ListOfTestsTableViewCell", for: indexPath) as? ListOfTestsTableViewCell {
            cell.configTestCell(raiting: 3, testName: "Test name", groupImage: "star")
            return cell
        }
        return UITableViewCell()
    }
}
