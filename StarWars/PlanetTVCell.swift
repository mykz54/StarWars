//
//  PlanetTVCell.swift
//  StarWars
//
//  Created by Michael San Minay on 01/03/2016.
//  Copyright © 2016 Michael San Minay. All rights reserved.
//

import UIKit

class PlanetTVCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    

    @IBOutlet weak var gravityLabel: UILabel!
    
    @IBOutlet weak var terrainLabel: UILabel!
    
    @IBOutlet weak var populationLabel: UILabel!
    
    
    
    
    class func configurePeopleInfoCell(tableView:UITableView,indexPath:NSIndexPath,pepInfoArray:NSMutableArray) -> PlanetTVCell{
        
        
        
        
        let cellPlanet = tableView.dequeueReusableCellWithIdentifier("cellPlanet", forIndexPath: indexPath) as! PlanetTVCell
        
        let planetInfo = pepInfoArray.objectAtIndex(indexPath.section)["BasicPlanetInfo"] as! PlanetsInfo
        
        cellPlanet.nameLabel.text = planetInfo._name
        cellPlanet.climateLabel.text = planetInfo._climate
        cellPlanet.gravityLabel.text = planetInfo._gravity
        cellPlanet.terrainLabel.text = planetInfo._terrain
        cellPlanet.populationLabel.text = planetInfo._population
        
        return cellPlanet
        
    }

}
