//
//  ViewController.swift
//  barnacle
//
//  Created by Chris Hume on 1/17/16.
//  Copyright © 2016 Chris Hume. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    // MARK: Properties

    @IBOutlet weak var postTextField: NSTextField!
    @IBOutlet weak var doneButton: NSButton!
    @IBOutlet weak var titleTextField: NSTextField!
    
    var toPass:String = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("toPass: ",toPass)
//        self.view.layer!.backgroundColor = NSColor.blueColor().CGColor
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // MARK: Actions
    
    @IBAction func doneBtn(sender: NSButton) {
        let content = postTextField.stringValue
        let title = titleTextField.stringValue
        let date = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        
        var post = ["title": title, "content":content , "date":date]
//        print(post)
        currentPosts.addToDict(post)
    }
    
//    func printTimestamp() {
//        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
//        print(timestamp)
//    }
    
    


}

