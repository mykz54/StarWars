//
//  PeopleTVCell.swift
//  StarWars
//
//  Created by Michael San Minay on 01/03/2016.
//  Copyright © 2016 Michael San Minay. All rights reserved.
//



import UIKit

class PeopleTVCell: UITableViewCell {

    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var bdayDateLabel:UILabel!
    @IBOutlet weak var genderLabel:UILabel!
    @IBOutlet weak var heightLabel:UILabel!
    @IBOutlet weak var homeWorldLabel:UILabel!
    
    
    
     class func configurePeopleInfoCell(tableView:UITableView,indexPath:NSIndexPath,pepInfoArray:NSMutableArray) -> PeopleTVCell{
        
        
        
        
        let cellPep = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PeopleTVCell
        
        let pepInfo = pepInfoArray .objectAtIndex(indexPath.section)["BasicPeopleInfo"] as! PeopleInfo
        
        cellPep.nameLabel.text = pepInfo._name;
        cellPep.bdayDateLabel.text = pepInfo._birth_year
        cellPep.genderLabel.text = pepInfo._gender
        cellPep.heightLabel.text = pepInfo._height
 
        
        return cellPep
        
        
    }
    
    
    
}
