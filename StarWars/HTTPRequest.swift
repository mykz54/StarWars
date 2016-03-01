//
//  HTTPRequest.swift
//  swiftFor2016
//
//  Created by Michael San Minay on 29/02/2016.
//  Copyright © 2016 Michael San Minay. All rights reserved.
//

import UIKit

class HTTPRequest: NSObject {
    
    
  

    func getRequest(urlString: String) -> NSURL{
        
        return NSURL(string: urlString)!
    }


    
    func httpGet(request: NSURLRequest!, completion: (responseDic: NSDictionary) -> Void) {
        

        
        
        
        let taskRequest = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler:{ (data, response, error) -> Void in
            
            
            
        
            
            if((error) != nil){
                
                print("Connection error: \(error)")
            
            }else{
                
                do{
                    
                    let dic = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [String:AnyObject]
                    
                    
                    completion(responseDic: dic)
                    
                    
                }
                catch {
                    
                    print("json error: \(error)")
                }
                

            }
            
            
            
            
        })
        
        taskRequest.resume()
            
            
            
            

    }

        
        
    
      
    
    
}
