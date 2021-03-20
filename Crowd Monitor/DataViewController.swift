//
//  DataViewController.swift
//  Crowd Monitor
//
//  Created by Swamita on 20/03/21.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let players = ["10-12pm","12-2pm", "2-4pm", "4-6pm", "6-8pm", "8-10pm"]
    let goals = ["6", "15", "26", "30", "8", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "dataCell")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
}

extension DataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataTableViewCell
        cell.countLabel.text = goals[indexPath.row]
        cell.timeLabel.text = players[indexPath.row]
        return cell
    }
}
