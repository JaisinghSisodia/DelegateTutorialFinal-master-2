//
//  ViewController.swift
//  DelegateTutorial
//
//  Created by James Rochabrun on 2/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

//MARK: step 4 conform the protocol here
class ClassAVC: UIViewController, ClassBVCDelegate {
    
    var width = 100.0
    var height = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var area: Double {
            
            get
            {
            return width * height
            }
            set(newarea)
            {
              let  val = newarea
                height = val
                width = val
            }
        }
      
        
        let arrNumber = [5,5,4,8,4,7,42,35,847,4588,95,7,42,5,879,55,23,58,7]
        
        let sortedarray = arrNumber.sorted()
        print(sortedarray)
        
        let descSorted = arrNumber.sorted { (num, num1) -> Bool in
            return num > num1
        }
        print(descSorted)
        
        area = 50
    print(area)
        
        
        let dict: [String : Int] = ["rollno" : 5]
        let dict1: [String : Int] = [ "rollno" : 3]
        
        var arrDict = [String : Int]()
      //  arrDict.append(dict)
      //  arrDict.append(dict1)
        print(arrDict)
        
        let ddd  = dict.filter { (key ,  value) -> Bool in
            value > 3
        }

        print(ddd)
        
        
        
        
        
      
        
        //property observer
        
        var observe = 02 {
            
            willSet
                {
                 print("value about to change \(newValue)")
            }
            didSet
            {
                print("old vale \(oldValue) to new value \(observe)")
            }
        }
        
  observe = 50
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let classbv = ClassBVC ()
        classbv.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        //MARK: step 5 create a reference of Class B and bind them through the prepareforsegue method
        if let nav = segue.destination as? UINavigationController, let classBVC = nav.topViewController as? ClassBVC {
           classBVC.delegate = self
        }
        
   
    }
//
    //MARK: step 6 finally use the method of the contract
    func changeBackgroundColor(_ color: UIColor?) {
        view.backgroundColor = color
    }

    
    
    
}
