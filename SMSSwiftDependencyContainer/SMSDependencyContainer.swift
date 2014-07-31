
//
//  SMSDependencyContainer.swift
//  SMSSwiftDependencyContainer
//
//  Created by Tony Merante on 7/3/14.
//  Copyright (c) 2014 SMS. All rights reserved.
//

import Foundation



private let _DependencyContainerSharedInstance = DependencyContainer()

class DependencyContainer {
    
    enum DependencyContainerScope {
        case Singleton
        case Transient
    }
    
    class var sharedInstance : DependencyContainer {
        return _DependencyContainerSharedInstance
    }
    
    private var container :Dictionary<String, () -> AnyObject?>
    
   
    init() {
        self.container = Dictionary()
    }
    
    func formatKey(protocolKey ckey:String, classKey pkey:String) -> String {
        return ckey + "." + pkey;
    }
    
//    func resolve<T,U>(protocolNameString pname: Protocol, classNameString cName :AnyClass) -> T
//    {
////        let formattedKey = formatKey(protocolKey: pname, classKey: cName)
//        
//        let className = pname.dynamicType
//        
//        let d = cName.Type.description();
//        
//        
//        
//        var block = self.container[className]
//        
//        return block();
//    }
    
    /*
    .Type ( class, structs, enums
    
    -- meta type followed by .type
    
    -- .Protocol -- name of the protocol
    
    --.self returns the class itself not an instance
    -- .self returns the protocol itself not an instance tht conforms to the protocol
    
    -- dynamicType on instance to access the instances runtime type
    



    */
    func bind(className:AnyClass, scope:DependencyContainerScope) {
        
//        let str2 = myModel.description()
        let classNameAsString = className.self.description()
        
//        println(str2)
        println(classNameAsString)
        
        let aClass = NSClassFromString(classNameAsString) as NSObject.Type
        
        if scope == DependencyContainerScope.Singleton {
        
            println(aClass)
            
            let t = aClass()
            self.container[classNameAsString] = {
                println("in func")
                return t
            }
        } else {
            self.container[classNameAsString] = {
                println("in func")
                return aClass()
            }
        }
        
        
    }
    func items() -> Int {
        return self.container.count
    }
    

    func resolve<T>(className:AnyClass) -> T {
        let key = className.self.description()
       
        println(key)

        let obj = self.container[key]
       
        return obj!() as T!
    }
////
//    func bindToProtocol<T,U>(protocolName: T, className:U, inScope:DependencyContainerScope )
//    {
////    NSAssert([class conformsToProtocol:protocol], @"class %@ does not conform to protocol %@", NSStringFromClass(class), NSStringFromProtocol(protocol));
//    
//        let classSelf = U.self
//      
//    if inScope == DependencyContainerScope.Singleton {
//        var classInit = classSelf()
//    }
//    
//    if className as Protocol {
//        self.container setObject: ^id {
//    
//    if(scope == SMSDependencyContainerScopeSingleton){
//    return object;
//    }
//    
//    return [[class alloc]init];
//    } forKey:[self formatKey:NSStringFromProtocol(protocol) classKey:NSStringFromClass(class)]];
//    }
//    }
    
//    - (id)resolve:(Protocol *)protocol
//    {
//    SMSDependencyContainerHandler block = [self.container objectForKey:[self formatKey:NSStringFromProtocol(protocol) classKey:NSStringFromProtocol(protocol)]];
//    return block();
//    }
}

/*

//
//  SMSDependencyContainer.m
//  SMSDependencyContainer
//
//  Created by Tony Merante on 10/26/13.
//  Copyright (c) 2013 Societymedia. All rights reserved.
//

#import "SMSDependencyContainer.h"


@interface SMSDependencyContainer()
@property (nonatomic, strong) NSMutableDictionary *container;
@end

@implementation SMSDependencyContainer
typedef id (^SMSInstanceHandler)(void);


- (id)init
{
self = [super init];
if (self)
{
self.container =  [NSMutableDictionary dictionary];
}

return self;
}

+ (instancetype)sharedInstance
{
static dispatch_once_t once;
static SMSDependencyContainer *sharedInstance;
dispatch_once(&once, ^{
sharedInstance = [[self alloc] init];
});
return sharedInstance;
}

- (NSString*)formatKey:(NSString*)protocolKey classKey:(NSString*)classKey
{
return [NSString stringWithFormat:@"%@.%@", protocolKey, classKey];
}

- (id)resolve:(Protocol *)protocol forClass:(Class)class
{
SMSDependencyContainerHandler block = [self.container objectForKey:[self formatKey:NSStringFromProtocol(protocol) classKey:NSStringFromClass(class)]];
return block();
}
- (id)resolve:(Protocol *)protocol
{
SMSDependencyContainerHandler block = [self.container objectForKey:[self formatKey:NSStringFromProtocol(protocol) classKey:NSStringFromProtocol(protocol)]];
return block();
}

- (void)bindToProtocol:(Protocol *)protocol withClass:(Class)class inScope:(SMSDependencyContainerScope)scope
{
NSAssert([class conformsToProtocol:protocol], @"class %@ does not conform to protocol %@", NSStringFromClass(class), NSStringFromProtocol(protocol));

id object;
if(scope == SMSDependencyContainerScopeSingleton){
object = [[class alloc]init];
}

if([class conformsToProtocol:protocol]){
[self.container setObject: ^id {

if(scope == SMSDependencyContainerScopeSingleton){
return object;
}

return [[class alloc]init];
} forKey:[self formatKey:NSStringFromProtocol(protocol) classKey:NSStringFromClass(class)]];
}
}


- (void)addObject:(id)instance {
if(![self.container objectForKey:instance]){
[self.container setObject:instance forKey:instance];
}
}


@end
*/