//
//  AppDelegate.swift
//  WestfieldDecodedHackathon2014
//
//  Created by JUDIT GRESKOVITS, MAYA BONKOWSKI on 20/09/2014.
//  Copyright (c) 2014 JUDIT GRESKOVITS, MAYA BONKOWSKI. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // iBeacon extras
    var locationManager: CLLocationManager?
    var lastProximity: CLProximity?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let uuidString = "235D6282-820C-43CE-9763-8E4270641CEC" // applix beacons major:810, minor:1-3
        
        let beaconIdentifier = "MyColours"
        let beaconUUID:NSUUID = NSUUID(UUIDString: uuidString)
        let beaconRegion:CLBeaconRegion = CLBeaconRegion(proximityUUID: beaconUUID, identifier: beaconIdentifier)
 
        locationManager = CLLocationManager()
        if(locationManager!.respondsToSelector("requestAlwaysAuthorization")){
            locationManager!.requestAlwaysAuthorization()
        }
        locationManager!.delegate = self
        locationManager!.pausesLocationUpdatesAutomatically = false
        
        locationManager!.startMonitoringForRegion(beaconRegion)
        locationManager!.startRangingBeaconsInRegion(beaconRegion)
        locationManager!.startUpdatingLocation()

        if application.respondsToSelector("registerUserNotificationSettings") {
            application.registerUserNotificationSettings(
                UIUserNotificationSettings(
                    forTypes: UIUserNotificationType.Alert | UIUserNotificationType.Sound,
                    categories: nil
                )
            )
        }
        
        return true
    }
    
//    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//    // Override point for customization after application launch.
//    return true
//    }
//    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.bonkovits.WestfieldDecodedHackathon2014" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as NSURL
        }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("WestfieldDecodedHackathon2014", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)
        }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("WestfieldDecodedHackathon2014.sqlite")
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application's saved data."
        if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil, error: &error) == nil {
            coordinator = nil
            // Report any error we got.
            let dict = NSMutableDictionary()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            error = NSError.errorWithDomain("YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
        return coordinator
        }()
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
        }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }
    
}

extension AppDelegate: CLLocationManagerDelegate {
    func sendLocalNotificationWithMessage(message: String!) {
        let notification:UILocalNotification = UILocalNotification()
        notification.alertBody = message
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func locationManager(manager: CLLocationManager!,
        didRangeBeacons beacons: [AnyObject]!,
        inRegion region: CLBeaconRegion!) {
//            NSLog("didRangeBeacons")
            var message:String = "";
            
//            let viewController:ViewController = window!.rootViewController as ViewController
//                        viewController.beacons = beacons as [CLBeacon]?
//                        viewController.tableView!.reloadData()
            
            if(beacons.count > 0) {
                let nearestBeacon:CLBeacon = beacons[0] as CLBeacon
                if nearestBeacon.proximity == lastProximity || nearestBeacon.proximity == CLProximity.Unknown {
                    return
                }
                lastProximity = nearestBeacon.proximity
                var beaconID = MyBeaconIDModel.instance.setBeaconID(nearestBeacon.minor)
                
                switch nearestBeacon.proximity {
                case CLProximity.Far:
                    message = "You are far away from beacon " + nearestBeacon.minor.stringValue                 case CLProximity.Near:
                    message = "You are near beacon " + nearestBeacon.minor.stringValue
                case CLProximity.Immediate:
                    message = "You are in the immediate proximity of beacon " + nearestBeacon.minor.stringValue
                case CLProximity.Unknown:
                    return
                }
            } else {
                if lastProximity == CLProximity.Unknown {
                    return
                }
                message = "No beacons are nearby"
                lastProximity = CLProximity.Unknown
            }
            
            NSLog("%@", message)
            sendLocalNotificationWithMessage(message)
    }
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        manager.startRangingBeaconsInRegion(region as CLBeaconRegion)
        manager.startUpdatingLocation()
        
        NSLog("You entered the region")
        sendLocalNotificationWithMessage("You entered the region")
    }
    
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        manager.stopRangingBeaconsInRegion(region as CLBeaconRegion)
        manager.stopUpdatingLocation()
        
        NSLog("You exited the region")
        sendLocalNotificationWithMessage("You exited the region")
    }
}


