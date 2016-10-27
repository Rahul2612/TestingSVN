//
//  APIService.swift
//  AlamofireDemo
//
//  Created by ABBACUS TECH on 20/10/16.
//  Copyright © 2016 ABBACUS TECH. All rights reserved.
//

import UIKit
import Alamofire

protocol networkProtocol : class
{
    // func responseSuccess(request: AnyObject , dictionary : NSDictionary , apiTag : Int) -> Void
}

/*!
 * MARK: "ResultSuccess" Success Block
 * @param request:send request
 * @param result:dictionary of result
 * @param sender:temporary object and retured the same like before the request it was
 * @param response:response of api
 */
public typealias ResultSuccess = (_ request: AnyObject, _ result: AnyObject, _ sender: AnyObject?, _ response: DefaultDataResponse) -> Void

/*!
 * MARK: "ResultFail" Failure Block
 * @param request:send request
 * @param resultError:error response
 * @param sender:temporary object and retured the same like before the request it was
 * @param response:response of api
 */
public typealias ResultFail = (_ request: AnyObject, _ resultError: AnyObject, _ sender: AnyObject?, _ response: DefaultDataResponse) -> Void




class APIService: NSObject {

    
    var resultSuccess : ResultSuccess!
    var resultFail : ResultFail!

    
    /*!
     * MARK: "makeApiRequest()" is used to call API
     * @param method: used to show GET,POST,HEAD method.
     * @param url: show api url
     * @param parameters: parameters of api
     * @param headers:request type,content type,format of url
     * @param encoding:format of body
     * @param isJsonRequest:response format json
     * @param isSoapService:Soap api
     * @param isXmlResponse:response format xml
     * @param isCheckInternet:To check internet
     * @param isSingletonError:if true then response will not be move forward and you can show alert of an error
     * @param isLoader:Show loader is loading or not
     * @param senderDelegate:protocol delegate
     * @param loaderText:to show loader text
     * @param sender:temporary object and retured the same like before the request it was
     * @param success_block:Success block
     * @param fail_block:Failure Block
     */

    
    func MakeAPIRequest (_ method : Alamofire.HTTPMethod , url : String, parameter: [String : AnyObject]? , headers : [String: String]? = nil, encoding: ParameterEncoding , isJOSNRequest : Bool, isSOAPRequest : Bool, isXMLRequest : Bool, isCheckInterner : Bool, isLoader: Bool, LoaderText : String, success_block: @escaping ResultSuccess, fail_block: @escaping ResultFail ){
        
        
        
        var encodingError : NSError? = nil
        
        // check parameter 
        
        do {
            if parameter != nil {
                
                let data = try JSONSerialization.data(withJSONObject: parameter!, options: JSONSerialization.WritingOptions())
                let str = String(data : data , encoding: String.Encoding.utf8)! as String
                debugPrint(str)
                
            }
        } catch  {
            
            encodingError = error as NSError
            debugPrint(encodingError)
        }
        
        
        
        self.resultSuccess = success_block
        self.resultFail = fail_block
        
        if isJOSNRequest == true || isSOAPRequest == false {
            // for  JSON Request
            
        
        }else{
            
            // For Soap or NonJson service
            
            Alamofire.request(url, method: .post , parameters: parameter, encoding: encoding, headers: headers).responsePropertyList{ (response) in
                debugPrint(response)
                print(response.result)
                let dta = response.result.value
                print("DATA::\(dta)")
                
                
//                if let data = response.result.value?.data(using: String.Encoding.utf8)
//                {
//                    do
//                    {
//                        let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
//                        debugPrint(dict)
//                    } catch let error as NSError
//                    {
//                        debugPrint(error)
//                    }
//                }
        }
    }
  }
}
