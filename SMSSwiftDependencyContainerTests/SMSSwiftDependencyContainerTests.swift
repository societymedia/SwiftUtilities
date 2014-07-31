//
//  SMSSwiftDependencyContainerTests.swift
//  SMSSwiftDependencyContainerTests
//
//  Created by Tony Merante on 7/3/14.
//  Copyright (c) 2014 SMS. All rights reserved.
//

import XCTest


protocol myProtocol {
    
}

class myClass : myProtocol {
    
}

class SMSSwiftDependencyContainerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testResolveOfContainer() {
        

        //let container = DependencyContainer()
        
        //let key = container.formatKey(protocolKey: "protocolKey", classKey: "classKey")
        
        
    }
    
    func testMetaTypes() {
        let date:NSDate = NSDate()
        
        let str = date.description
        println("description of date instance:\(str)")
        
        let str1 = date.dynamicType.description()
        println("dynamic type of date instance:\(str1)")
        
        let str2 = NSDate.self.description()
        println("Type of NSDate:\(str2)")
    
        

       // XCTAssert(str, "str shouldnt be null")
    }
    
    
    
}
