//
//  AppDelegate.swift
//  Todoey
//
//  Created by Kenji Fukuda on 2018/10/26.
//  Copyright © 2018年 Kenji Fukuda. All rights reserved.
//  Command + Shift + g

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // This where Realm data is stored as Realm.default
        // print(Realm.Configuration.defaultConfiguration.fileURL!)
        // file:///Users/fkenji/Library/Developer/CoreSimulator/Devices/EC07C08D-B553-414A-89E0-CEAF60A7CFB8/data/Containers/Data/Application/EF3990A4-CC05-4B36-8F33-069B68A3E1E7/Documents/default.realm

        do {
            _ = try Realm()

        } catch {
            print("Error initializing new realm, \(error)")
        }
        
        return true
    }

}

