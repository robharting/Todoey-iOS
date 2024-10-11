//
//  AppDelegate.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        // prints for where storage with UserDefaults
        // print("didFinishLaunchingWithOptions")
        // print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        
        // where is relad db stored. open realm on from disk with MacOs App Realm Studio
        print("Realm db is located here at: \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
        
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new Realm db: \(error)")
        }
        
        return true
    }


}

