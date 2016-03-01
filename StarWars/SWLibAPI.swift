//
//  SWLibAPI.swift
//  swiftFor2016
//
//  Created by Michael San Minay on 29/02/2016.
//  Copyright © 2016 Michael San Minay. All rights reserved.
//

import UIKit



protocol RequestDelegate: class{
    
    
    func didReceiveRequestData(receiveData:NSDictionary)
    
    func didReceivePalnetData(receivedData:NSDictionary)
    
    func didRecieveStarShipData(receivedData:NSDictionary)
    
}

class SWLibAPI: NSObject {


    private let httRequest:HTTPRequest
    weak var delegate:RequestDelegate?
    
    
    
    class var sharedInstance:SWLibAPI {
        
        struct _shareInstances {
            //3
            static let instance = SWLibAPI()
        }
        //4
        return _shareInstances.instance
        
    }
    
    
    override init() {
        
        httRequest = HTTPRequest()
      super.init()
    }

    
    
    func getPeople(urlString:String){
        
        
        //https://swapi.co/api/people/1/?format=json
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        
        httRequest.httpGet(request, completion: {(responseDic:NSDictionary) in
            
    
            self.delegate?.didReceiveRequestData(responseDic)
            
            
            
        })
        
    }
    
    
    func getPlanetInfo(urlSring:String){
        
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: urlSring)!)
        
        httRequest.httpGet(request, completion: {(responseDic:NSDictionary) in
            
            
            self.delegate?.didReceivePalnetData(responseDic)
            
            
            
        })
        
    }
    
    
    func getStarshipsInfo(urlSring:String){
        
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: urlSring)!)
        
        httRequest.httpGet(request, completion: {(responseDic:NSDictionary) in
            
            
            self.delegate?.didRecieveStarShipData(responseDic)
            
            
            
        })
        
    }


    
    
    
    
}
