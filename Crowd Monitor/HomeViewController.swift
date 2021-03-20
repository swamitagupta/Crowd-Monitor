//
//  HomeViewController.swift
//  Crowd Monitor
//
//  Created by Swamita on 19/03/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var thresholdTextField: UITextField!
    
    let alerts = [["Alert!", "The count has reached the threshold value of 50.", "7:30 pm"], ["Warning", "90% of threshold value reached.","7:25 pm"], ["Warning", "90% of threshold value reached.","3:10 pm"]]
    
    var selectedThreshold = "50"
    let thresholdList = ["10", "20", "30", "40", "50", "60", "70", "80", "90", "100"]
    
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        thresholdTextField.delegate = self
        picker.delegate = self
        picker.dataSource = self
        tableView.register(UINib(nibName: "AlertTableViewCell", bundle: nil), forCellReuseIdentifier: "alertCell")
        thresholdTextField.inputView = picker
        dismissPickerView()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alertCell") as! AlertTableViewCell
        let details = alerts[indexPath.row]
        cell.titleLabel.text = details[0]
        cell.descriptionLabel.text = details[1]
        cell.timeLable.text = details[2]
        cell.titleLabel.textColor = details[0] == "Alert!" ? UIColor.red : UIColor.yellow
        return cell
    }
}

extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return thresholdList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return thresholdList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedThreshold = thresholdList[row]
        thresholdTextField.text = selectedThreshold
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
        thresholdTextField.inputAccessoryView = toolBar
    }
    @objc func action() {
          view.endEditing(true)
    }
}
