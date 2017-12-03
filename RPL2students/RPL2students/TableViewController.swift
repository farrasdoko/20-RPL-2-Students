//
//  TableViewController.swift
//  RPL2students
//
//  Created by Gw on 02/12/17.
//  Copyright © 2017 FarrasDoko. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    
    var idSelected:String?
    var usernameSelected:String?
    var lbnamaSelected:String?
    
    //declare array siswa
    var arraysiswa = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("http://localhost/ServerRPL2/index.php/DataGuru/getKelas").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["List Kelas"].arrayObject {
                    self.arraysiswa = resData as! [[String : String]]
                }
                if self.arraysiswa.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arraysiswa.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        var serverid = arraysiswa[indexPath.row]
        
        
        var id = serverid["id"]
        var username = serverid["username"]
        var lbnama = serverid["nama"]
        
        //move to label
        cell.id.text = id
        cell.lbnama.text = lbnama
//        cell.username.text = username

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = arraysiswa[indexPath.row]
        
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        idSelected = task["id"]
         lbnamaSelected = task["nama"]
        usernameSelected = task["username"]
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "segue"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                let value = arraysiswa[indexPath.row]
                controller.passId = value["id"]
                 controller.passlbNama = value["nama"]
                controller.passUsername = value["username"]
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
