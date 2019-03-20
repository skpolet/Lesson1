//
//  GroupDescriptionController.swift
//  Lesson1
//
//  Created by Sergey Mikhailov on 16/03/2019.
//  Copyright © 2019 Sergey Mikhailov. All rights reserved.
//

import UIKit

class GroupDescriptionController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var groupDesc: Group!
    let imageView = UIImageView()
    @IBOutlet weak var descriptionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableView.estimatedRowHeight = 50
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = UIColor.darkGray
        
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200)
        imageView.image = groupDesc?.groupPhoto
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GroupDescriptionController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DescriptionGroupCell.self), for: indexPath) as! DescriptionGroupCell
        cell.nameGroup.sizeToFit()
        cell.nameGroup.layoutIfNeeded()
        cell.nameGroup.text = groupDesc.groupName
        cell.heartCount.text = String(describing: groupDesc.countLikes)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 120), 400)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)


    }
}
