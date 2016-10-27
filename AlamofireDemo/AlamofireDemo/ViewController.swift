//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by ABBACUS TECH on 19/10/16.
//  Copyright © 2016 ABBACUS TECH. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbl : UITableView!
    var arrData : [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.getCountryData()
        
        self.tbl.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
    // MARK: Convert to swift JSON
    func convertStringToSwiftyJson(text: String) -> JSON? {
        if let data = text.data(using: String.Encoding.utf8) {
            let json = JSON(data: data)
            return json
        }
        return nil
    }
    func getCountryData() -> Void {
        
        Alamofire.request("http://sharetime.on-linedemo.com/CommonWebService.asmx/getCountryList").responsePropertyList { (response) in
            
            print(response.request)
            debugPrint(response)
            debugPrint(response.data)
//            debugPrint(response.result)
            
            if let json = response.result.value {
                let swiftyJsonVar = JSON(response.result.value!)
                let data = swiftyJsonVar.string?.data(using: String.Encoding.utf8)
               
                do {
                  let resultDic  = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    
                    
                    print("resultDic::\(resultDic!)")
                    
                    self.arrData = resultDic?["result"] as! [AnyObject]
                    
                    /*
                    let json = JSON(data: data!)
                    print(json)
                    print(json["status"])
                    self.arrData = json["result"].arrayValue as [AnyObject]
                     */
                    
                    for item in self.arrData{
//                        print(item)
                        print("CountryName:: \(item["countryName"]!)")
                        let Name = item["countryName"]!
                        let ID = (item["countryId"]!)!
                        print("Name:: \(Name!)")
                        print("Id::\(ID)")
                    }
                    
                    print("arrdata::\(self.arrData)")
 
                    if self.arrData.count > 0 {
                        self.tbl.reloadData()
                    }
                
                } catch let error as NSError {
                    print(error)
                }
                
               
                
            }
            
        
            // first Method using swifty JSON
//            let swiftyJson = JSON(response.result.value!)
//            print("SwiftJSON : \(swiftyJson)")
//            
//            print("status:: \(swiftyJson["result"] as? Array)")
//            
//            let status = swiftyJson["status"] as? String
//            
//            print(status)
//            
//            // second method
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }

    
        }
    
       
    }

    // MARK: Tableview Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell : UITableViewCell = self.tbl.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        cell.accessoryType = .disclosureIndicator
        let dic  = arrData[indexPath.row]
        print(dic)
        cell.textLabel?.text = dic["countryName"] as? String
        print(cell.textLabel?.text)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let obj : StateVC = self.storyboard?.instantiateViewController(withIdentifier: "StateVC") as! StateVC
        let dic  = arrData[indexPath.row]
        print(dic)
        let i = dic["countryId"] as? Int
        print(i)
        let myStr = String(describing: i)
        obj.strCountryID = myStr
        self.navigationController?.pushViewController(obj, animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

