//
//  ViewControllerAddTask.swift
//  TimeBreak 1
//
//  Created by Maria Madalena Teles on 1/15/17.
//  Copyright © 2017 Maria Madalena Teles. All rights reserved.
//

import UIKit

class ViewControllerAddTask: UIViewController {
    
    @IBOutlet var MyTaskTextField: UITextField!
    
    @IBOutlet var StartingDateOfTaskTextField: UITextField!
    
    @IBOutlet var DueDateOfTaskTextField: UITextField!
    
    
    @IBOutlet var TimeForCompletionLabel: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    var chosenDate = TimeInterval()
    
    @IBAction func AddTaskButtonTapped(_ sender: UIButton) {
        chosenDate = datePicker.countDownDuration
    }
    
    
    @IBAction func CancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    

    
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
