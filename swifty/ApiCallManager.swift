//
//  ApiCallManager.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/30/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import Alamofire

class ApiCallManager {
    var token:String?
    var expire:NSDate?
    var delegate:ApiCallManagerDelegate?
    
    func is_expire()-> Bool{
        if (NSDate().timeIntervalSince1970 > expire?.timeIntervalSince1970) {
            return true
        }
        return false
    }
    
    func makeRequest(fct:() -> Void){
        if token != nil && !is_expire() {
            fct()
        }
        else {
            Alamofire.request(
                .POST,
                "https://api.intra.42.fr/oauth/token",
                parameters: ["grant_type": "client_credentials", "client_id" : "9d1107734bfdd84c6644a6d624681f0bdb9c731a284c058eefe54b30e309b2fe", "client_secret" : "8d9bf51aede92ba8311413b901574517b4a9ecac2a5aa52468cc7cb8fa09b6d4" ],
                encoding: .URL)
                .responseJSON { (response) -> Void in
                    guard response.result.isSuccess else {
                        print("Error while getting token: \(response.result.error)")
                        return
                    }
                    guard let value = response.result.value as? [String: AnyObject],
                        let tk = value["access_token"] as? String, let duration = value["expires_in"] as? Double else{
                            if let d = self.delegate {
                                d.handleErrors("Malformed data received from token service")
                            }
                            print("Malformed data received from token service :"+String(response.result.value))
                            return
                    }
                    self.token = tk
                    self.expire = NSDate().dateByAddingTimeInterval(duration)
                    print("token \(self.token!) "/*expire \(self.expire!)"*/)
                    fct()
            }
        }
    }
    
    func searchUser(login:String) {
            let url = "https://api.intra.42.fr/v2/users/"+login.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLFragmentAllowedCharacterSet())!
            makeRequest(){
                Alamofire.request(
                   .GET,
                   url,
                   headers: ["authorization": "Bearer "+self.token!],
                   encoding: .URL)
                   .responseJSON {
                     response in
                    if response.response?.statusCode == 404 {
                        print("404")
                        if let d = self.delegate {
                            d.treatResponse(nil)
                        }
                    }
                    else {
                        guard let values = response.result.value as? [String: AnyObject],
                            let usr = User(values:values) else{
                                if let d = self.delegate {
                                    d.handleErrors("Malformed data received from user")
                                }
                                print("Malformed data received from user  ")
                                return
                        }
                        if let d = self.delegate {
                            d.treatResponse(usr)
                        }
                    }
                }
            
        }
    }
    
    
    
        
}

protocol ApiCallManagerDelegate {
    func handleErrors(msg:String) -> Void
    func treatResponse(response:AnyObject?) -> Void
    
}