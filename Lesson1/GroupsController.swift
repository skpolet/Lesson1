//
//  GroupsController.swift
//  Lesson1
//
//  Created by Sergey Mikhailov on 08/03/2019.
//  Copyright © 2019 Sergey Mikhailov. All rights reserved.
//

import UIKit

class GroupsController: UITableViewController {

    var group : [Group] = [Group(groupName: "Котики", groupPhoto: "https://cs8.pikabu.ru/post_img/big/2018/03/26/8/1522069566199676512.jpg", isSubscribe: true),Group(groupName: "Собачки", groupPhoto: "https://bipbap.ru/wp-content/uploads/2017/10/07_06_2017_10_08_15_jijtj2ru3nraq07t0u7a9degh0_war6mice03.jpg", isSubscribe: true),Group(groupName: "Автомобили", groupPhoto: "https://www.avtovzglyad.ru/media/article/P90258076_highRes_the-new-bmw-2-series.jpg.740x555_q85_box-439%2C28%2C3997%2C2697_crop_detail_upscale.jpg", isSubscribe: true),Group(groupName: "Цветы", groupPhoto: "https://cs2.livemaster.ru/storage/ed/c9/e47326de9d0f79f5ae50c2dcbfp7--tsvety-i-floristika-tsvety-v-korobke-s-syurprizom.jpg", isSubscribe: false),Group(groupName: "Печенье", groupPhoto: "https://s2.eda.ru/StaticContent/Photos/150420184224/160110003312/p_O.jpg", isSubscribe: false),Group(groupName: "Москва", groupPhoto: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Moscow-City2015.jpg/405px-Moscow-City2015.jpg", isSubscribe: false)]
    
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
        let items = group.filter{ $0.isSubscribe }.count
        
        if(groupSwitcher.selectedSegmentIndex==0)
        {
            return items
        }else{
            return items
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GropsCell.self), for: indexPath) as! GropsCell
        let itemstrue = group.filter{ $0.isSubscribe == true}
        let itemsfalse = group.filter{ $0.isSubscribe == false}
        if(groupSwitcher.selectedSegmentIndex==0){
            let url = URL(string: itemstrue[indexPath.row].groupPhoto)
            let data = NSData(contentsOf: url!)
            cell.groupPhoto.image = UIImage(data: data! as Data)
            cell.groupName.text = itemstrue[indexPath.row].groupName
        }else{
            let url = URL(string: itemsfalse[indexPath.row].groupPhoto)
            let data = NSData(contentsOf: url!)
            cell.groupName.text = itemsfalse[indexPath.row].groupName
            cell.groupPhoto.image = UIImage(data: data! as Data)
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
    
}

struct Group {
    let groupName : String
    let groupPhoto : String
    let isSubscribe : Bool
}

