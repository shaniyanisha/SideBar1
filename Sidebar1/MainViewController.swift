//
//  ViewController.swift
//  Sidebar1
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //Mark: Variables
    var displayView = UIViewController()
    var sidebar = MenuViewController()
    var  rightSidebar = RightViewController()
    
    
    //Mark: Outlets
    @IBOutlet weak var sideBarButton: UIButton!
    @IBOutlet weak var rightSideBarButtonn: UIButton!
    
    
    //Mark: View Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //adding RightViewController as a child view controller on click to rightSidebarButton
        //*------------------------------------------------------------------------------------*

        sidebar = storyboard?.instantiateViewController(withIdentifier:"MenuViewControllerID" ) as! MenuViewController
        
        
        
//        //adding RightViewController as a child view controller on click to rightSidebarButton
//        //*------------------------------------------------------------------------------------*
//        
//       rightSidebar = storyboard?.instantiateViewController(withIdentifier:"RightViewControllerID" ) as! RightViewController
//        
//        self.addChildViewController(rightSidebar)
//        self.view.addSubview(rightSidebar.view)
//        rightSidebar.didMove(toParentViewController: self)
//        rightSidebar.view.frame = CGRect(x: 575, y: 0, width: 200, height: 667)
//       
//        
////
        
        
    }
    
    //will show the all child views in main view
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.addChildViewController(displayView)
        self.view.addSubview(displayView.view)
        displayView.didMove(toParentViewController: self)
        displayView.view.frame = CGRect(x: 0, y: 70, width: self.view.frame.width, height: self.view.frame.height)
        
        //add a menu childsubview to main view
        self.addChildViewController(sidebar)
        self.view.addSubview(sidebar.view)
        sidebar.didMove(toParentViewController: self)
        sidebar.view.frame = CGRect(x: -200, y: 0, width: 200, height: 667)
                

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    //MARK: Action of sideBarButton
    @IBAction func sideeBarButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {() -> Void in
                
                self.sidebar.view.frame = CGRect(x: 0, y: 0, width: 200, height: 667)
                
                
            }, completion: nil)
            
            
        }
            
        else{
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {() -> Void in
                
                
                self.sidebar.view.frame = CGRect(x: -200, y: 0, width: 200, height: 667)
            }, completion: nil)
            
            
            
        }
        
        
    }
    
    
//    @IBAction func rightSideBarButton(_ sender: UIButton) {
//        
//        sender.isSelected = !sender.isSelected
//        
//        if sender.isSelected{
//            
//            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {() -> Void in
//                
//                self.rightSidebar.view.frame = CGRect(x: 0, y: 0, width: 200, height: 667)
//                
//                
//            }, completion: nil)
//            
//            
//        }
//            
//        else{
//            
//            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {() -> Void in
//                
//                
//                self.rightSidebar.view.frame = CGRect(x: 575, y: 0, width: 200, height: 667)
//            }, completion: nil)
//            
//            
//            
//        }
//        
//
//        
//        
//    }
    
    //function for changing the color of main view after calling 
    func changingDispalyOnMainView(_ newPage : UIViewController)
    {
        
        displayView.removeFromParentViewController()
        self.displayView = newPage
        viewWillLayoutSubviews()
        
        
        
    }
    

}
