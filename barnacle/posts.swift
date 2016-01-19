//
//  posts.swift
//  barnacle
//
//  Created by Chris Hume on 1/18/16.
//  Copyright © 2016 Chris Hume. All rights reserved.
//

import Cocoa

class posts: NSObject {
    var myNewDictArray = [[String:String]]()
    
    func addToDict(post: Dictionary<String, String>){
        myNewDictArray.append(post)
        print(myNewDictArray)
    }
    func getPosts() -> [[String:String]]{
        return self.myNewDictArray
    }
}
