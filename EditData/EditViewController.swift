//
//  ViewController.swift
//  EditData
//
//  Created by Cuong15tr on 10/26/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit
import os.log

class EditViewController: UIViewController {
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var editModel : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem , button == saveButton else {
            os_log("con cec", log: OSLog.default, type: .debug)
            return
        }
        editModel = editTextField.text
    }
}

