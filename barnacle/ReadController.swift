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
    var selectedRow = -1

    @IBOutlet weak var editButton: NSButton!
//    @IBOutlet weak var postContent: NSTextField!
    
    @IBOutlet weak var contentField: NSTextField!
//    @IBOutlet weak var postDate: NSTextField!
//    @IBOutlet weak var postTItle: NSTextField!
    @IBOutlet weak var titleField: NSTextField!

    @IBOutlet weak var postDate: NSTextField!
    @IBAction func editPost(sender: AnyObject) {
        //update post 
        let content = contentField.stringValue
        let title = titleField.stringValue
        let date = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        let post = ["title": title, "content":content , "date":date]
        ourPosts[selectedRow] = post
//        currentPosts[selectedRow] = post
        PostsTable.reloadData()
    }
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do view setup here.
        //print (ourPosts)
        //print ("didload")
    }
    
    override func viewDidAppear() {
        ourPosts = currentPosts.getPosts()
        //print (ourPosts)
        //PostsTable.reloadData()
    }
    
    
    
//    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject!) {
//        if (segue.identifier == "editPost") {
//            let svc = segue.destinationController as! ViewController;
//            
//            svc.toPass = "blue blah test passing"
//            
//        }
//    }
    
    @IBAction func savePost(sender: AnyObject) {
        let content = contentField.stringValue
        let title = titleField.stringValue
        let date = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        contentField.stringValue = ""
        titleField.stringValue = ""
        
        let post = ["title": title, "content":content , "date":date]
        currentPosts.addToDict(post)
        ourPosts.append(post)
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
//            print(bugDoc)
            print ("here")
//            cellView.imageView!.image = bugDoc.thumbImage
            cellView.textField!.stringValue = bugDoc["title"]!
            return cellView
        }
        
        return cellView
    }


    //view the content of the row selected
    func tableViewSelectionDidChange(notification: NSNotification) {
        selectedRow = self.PostsTable.selectedRow;
        if(selectedRow > -1){
            let viewingPost = ourPosts[selectedRow]
            self.titleField.stringValue = viewingPost["title"]!
            self.contentField.stringValue = viewingPost["content"]!
            self.postDate.stringValue = viewingPost["date"]!
        }
    }

}

// MARK: - NSTableViewDelegate
extension ReadController: NSTableViewDelegate {

}





