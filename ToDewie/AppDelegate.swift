//
//  AppDelegate.swift
//  ToDewie
//
//  Created by Holiday Twin Drive-In on 1/12/18.
//  Copyright © 2018 Josh. All rights reserved.
//

import UIKit

import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        
        
        do {
           _ = try Realm()
        } catch{
            print("Error initializing new Realm, \(error)")
        }
        
        
//        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        return true
    }

   




}

