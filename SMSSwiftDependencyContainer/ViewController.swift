//
//  ViewController.swift
//  SMSSwiftDependencyContainer
//
//  Created by Tony Merante on 7/3/14.
//  Copyright (c) 2014 SMS. All rights reserved.
//

import UIKit

class myModel : NSObject {
    let num :Int = random()
    init() {
        println("init of myModel")
    }
}



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let container = DependencyContainer.sharedInstance
        let key = container.formatKey(protocolKey: "protocolKey", classKey: "classKey")
        
        container.bind(myModel.self, scope: DependencyContainer.DependencyContainerScope.Singleton)
        
        println(container.items())
        
        var mm = container.resolve(myModel.self) as myModel
       
        println(mm.description)
        println(mm.num)
        
        var mm2 = container.resolve(myModel.self) as myModel
        println(mm2.num)
        
        container.bind(myModel.self, scope: DependencyContainer.DependencyContainerScope.Transient)

       println(container.items())
        println(key)
        
        
        
        
        //container.resolve(myModel.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

