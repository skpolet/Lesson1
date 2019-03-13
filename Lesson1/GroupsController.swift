//
//  GroupsController.swift
//  Lesson1
//
//  Created by Sergey Mikhailov on 08/03/2019.
//  Copyright © 2019 Sergey Mikhailov. All rights reserved.
//

import UIKit

class GroupsController: UITableViewController {

    var group : [Group] = [Group(groupName: "Котики", groupPhoto: UIImage(named: "cat")!, isSubscribe: true, isLikePressed: true, countLikes: 20, groupDescription: "Животные"),
                           Group(groupName: "Собачки", groupPhoto: UIImage(named: "dogs")!, isSubscribe: true, isLikePressed: false, countLikes: 3, groupDescription: "Животные"),
                           Group(groupName: "Автомобили", groupPhoto: UIImage(named: "car")!, isSubscribe: true, isLikePressed: false, countLikes: 15, groupDescription: "Техника"),
                           Group(groupName: "Цветы", groupPhoto: UIImage(named: "flower")!, isSubscribe: false, isLikePressed: false, countLikes: 44, groupDescription: "Растения"),
                           Group(groupName: "Печенье", groupPhoto: UIImage(named: "cookies")!, isSubscribe: false, isLikePressed: true, countLikes: 33, groupDescription: "Кулинария"),
                           Group(groupName: "Москва", groupPhoto: UIImage(named: "moscow")!, isSubscribe: false, isLikePressed: true, countLikes: 99, groupDescription: "Города")]
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var groupSwitcher: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupSwitcher.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)

    }
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl){
        if(groupSwitcher.selectedSegmentIndex==0)
        {
            self.tableView.reloadData()
        }else{
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var items = 0
        
        if(groupSwitcher.selectedSegmentIndex==0)
        {
            items = group.filter{ $0.isSubscribe == true}.count
            return items
        }else{
            items = group.filter{ $0.isSubscribe == false}.count
            return items
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GropsCell.self), for: indexPath) as! GropsCell
        let itemstrue = group.filter{ $0.isSubscribe == true}
        let itemsfalse = group.filter{ $0.isSubscribe == false}
        if(groupSwitcher.selectedSegmentIndex==0){
            cell.groupPhoto.image = itemstrue[indexPath.row].groupPhoto
            cell.groupName.text = itemstrue[indexPath.row].groupName
            cell.aboutGroup.text = itemstrue[indexPath.row].groupDescription
        }else{
            cell.groupName.text = itemsfalse[indexPath.row].groupName
            cell.groupPhoto.image = itemsfalse[indexPath.row].groupPhoto
            cell.aboutGroup.text = itemsfalse[indexPath.row].groupDescription
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "groupDescriptionSegue", sender: self)
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
        if (segue.identifier == "groupDescriptionSegue") {
            let viewController:GroupDescriptionController = segue.destination as! GroupDescriptionController
            let indexPath = self.tableView.indexPathForSelectedRow
            let itemstrue = group.filter{ $0.isSubscribe == true}
            let itemsfalse = group.filter{ $0.isSubscribe == false}
            if(groupSwitcher.selectedSegmentIndex==0){
                viewController.groupDesc = itemstrue[indexPath!.row]
            }else{
                viewController.groupDesc = itemsfalse[indexPath!.row]
            }
        }
    }
    
    @IBAction func didSelectSubscribe(segue: UIStoryboardSegue){
        if let vc = segue.source as? GroupDescriptionController{
            guard vc.groupDesc != nil else{
                return
            }
            if let fromDescGrop = group.index(where: {$0.groupName == vc.groupDesc?.groupName}) {
                if (vc.groupDesc?.isSubscribe == true){vc.groupDesc?.isSubscribe = false}
                else{vc.groupDesc?.isSubscribe = true}
                group[fromDescGrop] = vc.groupDesc!
                self.tableView.reloadData()
            }
        }
    }
    
}

struct Group {
    let groupName : String
    let groupPhoto : UIImage
    var isSubscribe : Bool
    var isLikePressed : Bool
    var countLikes : Int
    let groupDescription : String
}

