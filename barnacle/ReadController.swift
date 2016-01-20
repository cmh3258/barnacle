//
//  ReadController.swift
//  barnacle
//
//  Created by Chris Hume on 1/19/16.
//  Copyright © 2016 Chris Hume. All rights reserved.
//

import Cocoa

class ReadController: NSViewController {

    @IBOutlet weak var PostsTable: NSTableView!
  
    var ourPosts = currentPosts.getPosts()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        print (ourPosts)
        print ("didload")
    }
    
    override func viewDidAppear() {
        ourPosts = currentPosts.getPosts()
        print (ourPosts)
        PostsTable.reloadData()
    }

    

    
}

// MARK: - NSTableViewDataSource
extension ReadController: NSTableViewDataSource {
    func numberOfRowsInTableView(aTableView: NSTableView) -> Int {
        print (ourPosts.count)
        return ourPosts.count
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        // 1
        var cellView: NSTableCellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! NSTableCellView
        
        // 2
        if tableColumn!.identifier == "PostColumn" {
            // 3
            let bugDoc = self.ourPosts[row]
            print(bugDoc)
            print ("here")
//            cellView.imageView!.image = bugDoc.thumbImage
            cellView.textField!.stringValue = bugDoc["title"]!
            return cellView
        }
        
        return cellView
    }
}

// MARK: - NSTableViewDelegate
extension ReadController: NSTableViewDelegate {
}

