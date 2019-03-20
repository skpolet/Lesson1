//
//  GlobalData.swift
//  Lesson1
//
//  Created by Sergey Mikhailov on 19/03/2019.
//  Copyright © 2019 Sergey Mikhailov. All rights reserved.
//

import Foundation
import UIKit

struct Group {
    let groupName : String
    let groupPhoto : UIImage
    var isSubscribe : Bool
    var isLikePressed : Bool
    var countLikes : Int
    let groupDescription : String
}

struct User {
    let userName : String
    let userPhoto : [UIImage]
    let isFriend : Bool
    let email : String
    let phoneNumber : String
    let aboutUser : String
    var newsWall : [News]
}

struct News {
    let data : Date
    let newsPhotos : [UIImage]
    var isLike : Bool
    var countLikes : Int
    let newsText : String
    let comments : [Comments]
}

struct  Comments {
    let user : User
    let dataComment : Date
    var isLike : Bool
    var countLikes : Int
}

indirect enum Comment{
        case addComment(Comments)
        case pressLike(Comments)
        case deleteComment(Comments)
        
//        var result: Comments {
//            switch self {
//            case .addComment(let string):
//                break
//            case .pressLike():
//                break
//
//            case .deleteComment(_):
//                break
//            }
//        }
    
    func operation (_ comment: Comment, _ commentIndex: Int) ->Comment{
        let shared = GlobalData()
            switch self {
            case .addComment(let inComment):
                shared.commentsArr.append(inComment)
                return .addComment(shared.commentsArr[commentIndex])
            case .pressLike( _):
                if shared.commentsArr[commentIndex].isLike == true {
                    shared.commentsArr[commentIndex].isLike = false
                    shared.commentsArr[commentIndex].countLikes = shared.commentsArr[commentIndex].countLikes - 1
                }else{
                    shared.commentsArr[commentIndex].isLike = true
                    shared.commentsArr[commentIndex].countLikes = shared.commentsArr[commentIndex].countLikes + 1
                }

                return .pressLike(shared.commentsArr[commentIndex])
            case .deleteComment( _):
                shared.commentsArr.remove(at: commentIndex)
                return .deleteComment(shared.commentsArr[commentIndex])
            }
    }
}

class GlobalData {
    
    static let sharedGlobal = GlobalData()
    
    var testString: String = "Test" //for debugging
    var groupArr:[Group] = []
    let currentIndexGroup = 0
    //
    var newsArr:[News] = []
    var commentsArr:[Comments] = []
    var usersArr:[User] = []
    
    func getDescriptionGroup() ->String{
        return groupArr[currentIndexGroup].groupDescription
    }
    
    func groupInit(){
        groupArr.append(Group(groupName: "Котики", groupPhoto: UIImage(named: "cat")!, isSubscribe: true, isLikePressed: true, countLikes: 20, groupDescription: "Животные"))
        groupArr.append(Group(groupName: "Собачки", groupPhoto: UIImage(named: "dogs")!, isSubscribe: true, isLikePressed: false, countLikes: 3, groupDescription: "Животные"))
        groupArr.append(Group(groupName: "Автомобили", groupPhoto: UIImage(named: "car")!, isSubscribe: true, isLikePressed: false, countLikes: 15, groupDescription: "Техника"))
        groupArr.append(Group(groupName: "Цветы", groupPhoto: UIImage(named: "flower")!, isSubscribe: false, isLikePressed: false, countLikes: 44, groupDescription: "Растения"))
        groupArr.append(Group(groupName: "Печенье", groupPhoto: UIImage(named: "cookies")!, isSubscribe: false, isLikePressed: true, countLikes: 33, groupDescription: "Кулинария"))
        groupArr.append(Group(groupName: "Москва", groupPhoto: UIImage(named: "moscow")!, isSubscribe: false, isLikePressed: true, countLikes: 99, groupDescription: "Города"))
    }
}
