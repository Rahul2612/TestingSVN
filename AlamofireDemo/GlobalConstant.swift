//
//  GlobalConstant.swift
//  AlamofireDemo
//
//  Created by ABBACUS TECH on 20/10/16.
//  Copyright © 2016 ABBACUS TECH. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration



/*!
 * MARK: APIVersionCheck
 *  @param nsObject: to get app version
 *  @param appVersion: to get app version
 *  @param appType: check if app is android or ios type
 */

struct APIVersionCheck {
    
    static let nsObject: AnyObject? = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as AnyObject?
    static let appVersion = nsObject as! String
    static let appType = 2
    
}
/*!
 * MARK: APIVersion
 *  @param appVersion: for app version
 *  @param appType: for app version
 *  @param deviceToken: for deviceToken
 */
struct APIVersion {
    
    static let appVersion = "appVersion"
    static let appType = "appType"
    static let deviceToken = "deviceToken"
}
//MARK: Launch Screen's API
//MARK:
struct versionAPI
    
{    /*
     *Crash Report API
     */
    static var crashurl:String = "http://alliedfuel.on-linedemo.com/CommonWebService.asmx/addCrashReport"
    
    /*
     *Check Version API
     */
    static let versionUpdateUrl: String = "http://alliedfuel.on-linedemo.com/CommonWebService.asmx/checkAppVersion"
}


//MARK:Version check Status
//MARK:
struct Status
{
    static let appIsUnderConstrution = 0
    static let noVersionAvailable = 1
    static let versionAvailable = 2
}


//MARK: Methods To Check Internet Connection & To check null String
//MARK:



//MARK: AppString
//MARK:
struct AppString
{
    static let AppName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as! String
    static let Loading : String! = "Loading..."
}
