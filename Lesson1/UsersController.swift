//
//  UsersController.swift
//  Lesson1
//
//  Created by Sergey Mikhailov on 08/03/2019.
//  Copyright © 2019 Sergey Mikhailov. All rights reserved.
//

import UIKit

class UsersController: UITableViewController {
    
    let users = ["Иван":"https://dom2life.ru/media/content/w960/2017-11-08_10-33-31__1f07c53c-c457-11e7-8207-002590aa0fe7.jpg", "Петр":"https://v1.popcornnews.ru/upload/hDQnx4.jpg","Стас":"https://hochu.ua/thumbnails/articles/cropr_640x490/88305_0.jpg"]
    
    var indexPathRow : Int = 0

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UsersCell.self), for: indexPath) as! UsersCell
        let usersNames = [String](users.keys)
        let usersPhoto = [String](users.values)
        let url = URL(string: usersPhoto[indexPath.section])
        let data = NSData(contentsOf: url!)
        cell.userName.text = usersNames[indexPath.section]
        cell.userPhoto.image = UIImage(data: data! as Data)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "userPhotoSegue", sender: self)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "userPhotoSegue") {
            let viewController:PhotoController = segue.destination as! PhotoController
            let indexPath = self.tableView.indexPathForSelectedRow
            let usersNames = [String](users.keys)
            let usersPhoto = [String](users.values)
            viewController.userPhoto = usersPhoto[indexPath!.row]
            viewController.userName = usersNames[indexPath!.row]
        }
    }

}
extension UsersCell{
    
}
