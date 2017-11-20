//
//  ModelsTableViewController.swift
//  EditData
//
//  Created by Cuong15tr on 10/26/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit

class ModelsTableViewController: UITableViewController {
    var models = ["inphone 1" , "iphone 2"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return models.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = models[indexPath.row]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let vc = segue.destination as! EditViewController
        vc.editModel = models[tableView.indexPathForSelectedRow!.row]
    }
    @IBAction func unwinModel(segue: UIStoryboardSegue){
        if let sourceViewController = segue.source as? EditViewController{
            if let data = sourceViewController.editModel {
                if tableView.indexPathForSelectedRow?.row != nil {
                    models[tableView.indexPathForSelectedRow!.row] = data
                    tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
}
