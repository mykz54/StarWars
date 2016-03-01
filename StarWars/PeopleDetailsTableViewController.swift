//
//  PeopleDetailsTableViewController.swift
//  StarWars
//
//  Created by Michael San Minay on 01/03/2016.
//  Copyright © 2016 Michael San Minay. All rights reserved.
//

import UIKit

class PeopleDetailsTableViewController: UITableViewController,RequestDelegate {

    
    let peopleInfoArray = NSMutableArray()
    
    let operationQueue = NSOperationQueue()
    var nextPage:Int = 1
    
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        self.loadingIndicator.startAnimating()
        self.requestForPeople()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        

        return peopleInfoArray.count
        
        
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if section == 2{
            return 1
        }else{
            return peopleInfoArray .objectAtIndex(section).count
        }
     
        
        
        
        
        
        
        
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        

        // Configure the cell...
        
        
        if indexPath.section == 0 && peopleInfoArray .objectAtIndex(indexPath.section)["BasicPeopleInfo"]  != nil{
            
            
         
            
            return PeopleTVCell.configurePeopleInfoCell(tableView, indexPath: indexPath, pepInfoArray: peopleInfoArray)
            
            

            
        }else if indexPath.section == 1 && peopleInfoArray .objectAtIndex(indexPath.section)["BasicPlanetInfo"]  as? String != "Empty"{
         
            
           
            return PlanetTVCell .configurePeopleInfoCell(tableView, indexPath: indexPath, pepInfoArray: peopleInfoArray)
            
            

        }
        else{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("cellNext", forIndexPath: indexPath)
            return cell
        }
        
        
        
        
        
        
    }

    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var sectionName:String!
        
        
     
        switch (section)
        {
        case 0:
            sectionName = "Personal Info"
            break;
        case 1:
            sectionName = "Home Planet Info";
            break;
            // ...
        default:
            sectionName = "";
            break;
        }
        return sectionName;
        
    }
    
    
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK: Request Method
    
    func requestForPeople(){
        
        
        
        SWLibAPI.sharedInstance.delegate = self
        
   
        SWLibAPI.sharedInstance.getPeople("https://swapi.co/api/people/1/?format=json")
        
    
    }
    
    
    func didReceiveRequestData(receiveData: NSDictionary) {
        
        
        self .getPeopleInfo(receiveData)
    
        
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
        })
        
        
    }
    
    
    
    func getPeopleInfo(receiveData:NSDictionary){
     
        
        
        
        let newName = receiveData["name"] as! String
        let gender = receiveData["gender"] as! String
        let height = receiveData["height"] as! String
        let homeworld = receiveData["homeworld"] as! String
        let url = receiveData["url"] as! String
        let birth_year = receiveData["birth_year"] as! String
        
        
        let newPeopleInfo = PeopleInfo(newName: newName, birth_year: birth_year, gender: gender, height: height, homeworld: homeworld, url: url, films:"",starships: "")
        let basicInfo = NSDictionary( object: newPeopleInfo, forKey: "BasicPeopleInfo")
        peopleInfoArray .insertObject(basicInfo, atIndex: 0)
        
        
        
       
        
        operationQueue.addOperationWithBlock({
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                
                self.requestForPlanetInfo(homeworld)
            })
            
        })

        
    }
    
    func enumarateStarshipToDicToArray(receivedData:NSDictionary){
        
        if (receivedData["starships"] != nil){
      
            let array = receivedData["starships"] as! NSArray
            let mArray = NSMutableArray()
            
            
            array.enumerateObjectsUsingBlock({ object, index, stop in
                
                let pepInfo = PeopleInfo.init(newName: "", birth_year: "", gender: "", height: "", homeworld: "", url: "",films:"",starships: object as! String)
                
                
                mArray .addObject(pepInfo)
                
                
            })
            
            peopleInfoArray.insertObject(mArray, atIndex: 2)
            
            
           
            
            
        }
        
        
    }

    
    // Mark: -  RequestFor Planets
    
    func requestForPlanetInfo(strinURL:String){
        
        
        let correctedString = strinURL.stringByReplacingOccurrencesOfString("http", withString: "https")
        
        SWLibAPI.sharedInstance.delegate = self
        SWLibAPI.sharedInstance.getPlanetInfo(correctedString)
        
    }
    
    func didReceivePalnetData(receivedData: NSDictionary) {
        
        

        
        let name = receivedData["name"] as! String
        let climate = receivedData["climate"] as! String
        let gravity = receivedData["gravity"] as! String
        let terrain = receivedData["terrain"] as! String
        let population = receivedData["population"] as! String

        
        
        
        let newPlanetInfo = PlanetsInfo(name: name, climate: climate, gravity: gravity, terrain: terrain, population: population)
        let basicInfo = NSDictionary( object: newPlanetInfo, forKey: "BasicPlanetInfo")
        peopleInfoArray .insertObject(basicInfo, atIndex: 1)
        peopleInfoArray.insertObject("", atIndex: 2)

        
        dispatch_async(dispatch_get_main_queue(), {
            
            self.loadingIndicator.stopAnimating()
            self.tableView.reloadData()
        })

        
   

        
    }
    
    // MARK: - Starships
    
    
    func didRecieveStarShipData(receivedData: NSDictionary) {
        
        
        
        
    }
    
    
    

    @IBAction func tappedNext(sender: AnyObject) {
        
        nextPage++
        peopleInfoArray .removeAllObjects()
        self.loadingIndicator.startAnimating()
        
        SWLibAPI.sharedInstance.delegate = self
        
        SWLibAPI.sharedInstance.getPeople("https://swapi.co/api/people/\(nextPage)/?format=json")
        
        
        
        
        
    }
    
    @IBAction func tappedPrevButton(sender: AnyObject) {
        
        if nextPage != 1{
            
            nextPage--
            peopleInfoArray .removeAllObjects()
            SWLibAPI.sharedInstance.delegate = self
            
            SWLibAPI.sharedInstance.getPeople("https://swapi.co/api/people/\(nextPage)/?format=json")
            
            
            
            
        }
        
        
    }
    
    
    
    
    
}
