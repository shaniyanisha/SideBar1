//
//  MenuViewController.swift
//  Sidebar1
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
     //arrays of color
     var colorArray = ["Red","yellow","green","blue","black"]
    
    //Mark: Outlets
    @IBOutlet weak var contentTableView: UITableView!
    
    
    //Mark: View Life Cycle start
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contentTableView.dataSource = self
        contentTableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   }

//Mark: EXTENSION OF MenuViewController following table view delegates and datasource
extension MenuViewController : UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return colorArray.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellID", for: indexPath) as? tableCell else{
            
            fatalError("Cell Not Found")
        }
        
        //puts the name of label in each row from colorArray
        cell.colorName.text = colorArray[indexPath.row]
        
        return cell
        
    }
    
    // Called after the user changes the selection.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        //switch for adding each child view one by one in main view
        switch indexPath.row{
            
        
        case 0:
            let displayView = storyboard?.instantiateViewController(withIdentifier:"RedViewControllerID")as?  RedViewController
        
            let parent = self.parent as? MainViewController
            parent?.changingDispalyOnMainView(displayView!)
            
        case 1:
            let displayView = storyboard?.instantiateViewController(withIdentifier:   " YellowViewControllerID") as? YellowViewController
            let parent = self.parent as? MainViewController
            parent?.changingDispalyOnMainView(displayView!)
            
            
            
        case 2:
            let displayView = storyboard?.instantiateViewController(withIdentifier:   "GreenViewControllerID") as? GreenViewController
            let parent = self.parent as? MainViewController
            parent?.changingDispalyOnMainView(displayView!)
            
      
            
        case 3:
            let displayView = storyboard?.instantiateViewController(withIdentifier:   "BlueViewControllerID") as? BlueViewController
            let parent = self.parent as? MainViewController
            parent?.changingDispalyOnMainView(displayView!)
            
    
        case 4:
            let displayView = storyboard?.instantiateViewController(withIdentifier:   "BlackViewControllerID") as? BlackViewController
            let parent = self.parent as? MainViewController
            parent?.changingDispalyOnMainView(displayView!)
            
       
            
        default :
            let displayView = storyboard?.instantiateViewController(withIdentifier: "MainViewControllerID")      as! MainViewController
             let parent = self.parent as! MainViewController
            parent.changingDispalyOnMainView(displayView)


            
            
        }
    }
    
}


class tableCell: UITableViewCell{
    
    @IBOutlet weak var colorName: UILabel!
 
}





