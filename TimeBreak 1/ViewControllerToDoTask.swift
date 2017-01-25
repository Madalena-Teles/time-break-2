//
//  ViewControllerToDoTask.swift
//  TimeBreak 1
//
//  Created by Maria Madalena Teles on 1/15/17.
//  Copyright © 2017 Maria Madalena Teles. All rights reserved.
//

import UIKit

class ViewControllerToDoTask: UIViewController, UITableViewDataSource , UITableViewDelegate {
    
    var taskTimeToPass = 1800
    var nameToPass = ""
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var AddTaskLabel: UILabel!
    @IBOutlet var NameCategoryTextField: UITextField!
    @IBOutlet var TodaysDateTextField: UITextField!
    
    var taskArray: Array<String> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        taskArray = ["English homework", "Math homework", "Physics paper", "Chemistry test", "Free time"]
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cellIdentifier = "toDoCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for:
                indexPath as IndexPath) as UITableViewCell
            cell.textLabel?.text = taskArray[indexPath.row]
            return cell
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        nameToPass = taskArray[indexPath.row]
        performSegue(withIdentifier: "timerVC", sender: self)
    }
    
    @IBAction func AddTaskButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "addTaskButton", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "addTaskButton"){
            let destViewController = segue.destination as! ViewControllerAddTask
            }
        
        if (segue.identifier == "timerVC"){
        let destViewController = segue.destination as! ViewControllerTimer
        destViewController.taskName = nameToPass
        destViewController.timeForTask = taskTimeToPass}
    }

}
