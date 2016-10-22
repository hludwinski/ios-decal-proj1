//
//  StatsViewController.swift
//  To-Do List
//
//  Created by Hope Ludwinski on 10/22/16.
//  Copyright © 2016 Hope Ludwinski. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var completeCountLabel: UILabel!

    override func viewDidAppear(_ animated: Bool){
        var count:Int = 0
        let userDefaults: UserDefaults = UserDefaults.standard
        let completedList:NSMutableArray? = userDefaults.object(forKey: "completedList") as? NSMutableArray
        if((completedList) != nil){
            for timestamp:Any in completedList! {
                let date = timestamp as! NSDate
                if (NSCalendar.current.isDateInToday(date as Date)){
                    count = count + 1
                }
            }
        }
        completeCountLabel.text = String(count)
        userDefaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
