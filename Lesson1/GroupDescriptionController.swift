//
//  GroupDescriptionController.swift
//  Lesson1
//
//  Created by Sergey Mikhailov on 09/03/2019.
//  Copyright © 2019 Sergey Mikhailov. All rights reserved.
//

import UIKit

class GroupDescriptionController: UITableViewController {
    @IBOutlet weak var nameGroup: UILabel!
    @IBOutlet weak var photoGroup: UIImageView!
    @IBOutlet weak var subscribe: UIButton!
    
    public var groupDesc : Group?
    @IBOutlet weak var isLikeImage: UIImageView!
    @IBOutlet weak var countLikes: UILabel!
    
    //var tableCellBlock: (UITableViewCell) //-> UITableViewCell
    
    override func loadView() {
        super.loadView()
        
        if (groupDesc?.isSubscribe == true){
            subscribe.setTitle("unsubscribe", for: .normal)
        }else{
            subscribe.setTitle("subscribe", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoGroup.image = groupDesc?.groupPhoto
        nameGroup.text = groupDesc?.groupName
        countLikes.text = String(groupDesc!.countLikes)
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
