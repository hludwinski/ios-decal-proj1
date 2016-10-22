//
//  AddViewController.swift
//  To-Do List
//
//  Created by Hope Ludwinski on 10/16/16.
//  Copyright © 2016 Hope Ludwinski. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField! = UITextField()
    @IBOutlet var notesTextView: UITextView! = UITextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(_ sender: AnyObject) {
        
        let userDefaults:UserDefaults = UserDefaults.standard
        
        var itemList:NSMutableArray? = userDefaults.object(forKey: "itemList") as? NSMutableArray
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setValue(titleTextField.text, forKey: "itemTitle")
        dataSet.setValue(notesTextView.text, forKey: "itemNote")

        if((itemList) != nil){
            let newMutableList:NSMutableArray = NSMutableArray()
            for dict in itemList!{
                newMutableList.add(dict as! NSDictionary)
            }
            userDefaults.removeObject(forKey: "itemList")
            newMutableList.add(dataSet)
            userDefaults.set(newMutableList, forKey: "itemList")
            
        }else{

            itemList = NSMutableArray()
            itemList!.add(dataSet)
            userDefaults.set(itemList, forKey: "itemList")
        }
        userDefaults.synchronize()
        self.navigationController!.popToRootViewController(animated: true)
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
