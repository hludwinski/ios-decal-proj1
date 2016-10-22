//
//  DetailViewController.swift
//  To-Do List
//
//  Created by Hope Ludwinski on 10/16/16.
//  Copyright © 2016 Hope Ludwinski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
//
    @IBOutlet var titleTextField: UITextField? = UITextField()
    
    @IBOutlet var notesTextView: UITextView? = UITextView()
    
    var storedToDoData:NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField?.isUserInteractionEnabled = false
        notesTextView?.isUserInteractionEnabled = false
        
        titleTextField?.text = storedToDoData.object(forKey: "itemTitle") as! String?
        notesTextView?.text = storedToDoData.object(forKey: "itemNote") as! String?
        // Do any additional setup after loading the view.
    }

    @IBAction func deleteItem(_ sender: AnyObject) {
        let userDefaults:UserDefaults = UserDefaults.standard
        let itemListArray:NSMutableArray? = userDefaults.object(forKey: "itemList") as? NSMutableArray
        let mutableItemList:NSMutableArray = NSMutableArray()
        
        if ((itemListArray) != nil){
            for dict:Any in itemListArray! {
                mutableItemList.add(dict as! NSDictionary)
            }
        }
        mutableItemList.remove(storedToDoData)
        userDefaults.removeObject(forKey: "itemList")
        userDefaults.set(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
