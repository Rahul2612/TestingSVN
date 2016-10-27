//
//  StateVC.swift
//  AlamofireDemo
//
//  Created by ABBACUS TECH on 20/10/16.
//  Copyright © 2016 ABBACUS TECH. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class StateVC: UIViewController {

    @IBOutlet weak var tblState : UITableView!
    var strCountryID : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        print(strCountryID!)
        if let str = strCountryID {
            self.getStateList(countryid: str)
        }
    }

    func getStateList(countryid : String) -> Void {
        
        let paramtr = ["countryId" : countryid]
        
        Alamofire.request("http://sharetime.on-linedemo.com/CommonWebService.asmx/getStateList", method: .post  , parameters: paramtr , encoding: PropertyListEncoding.default, headers: nil).responsePropertyList { (response) in
            
            debugPrint("response::\(response)")
            debugPrint(response.result)
        
        }
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
