//
//  ReachabilityManager.swift
//  CountryData
//
//  Created by Mohammad Jahid on 30/04/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import Foundation
import Reachability

class ReachabilityManager: NSObject {
    
    // Shared instance
    static let shared = ReachabilityManager()
    
    // Tracks current NetworkStatus (notReachable, reachableViaWiFi, reachableViaWWAN)
    //var reachabilityStatus: Reachability.Connection!
    
    // Reachibility instance for Network status monitoring
    let reachability = Reachability()!
    
    /// Called whenever there is a change in NetworkReachibility Status
    ///
    /// — parameter notification: Notification with the Reachability instance
    @objc func reachabilityChanged(notification: Notification) {
        if let reachability = notification.object as? Reachability {
            
            let notificationNameON = Notification.Name(rawValue: AppConstants.RecabilityConstants.networkOnNotificationKey)
            let notificationNameOFF = Notification.Name(rawValue: AppConstants.RecabilityConstants.networkOffNotificationKey)
            
            switch reachability.connection {
            case .none:
                NotificationCenter.default.post(name: notificationNameOFF, object: nil)
                debugPrint("Network became unreachable")
            //reachabilityStatus = .none
            case .wifi:
                NotificationCenter.default.post(name: notificationNameON, object: nil)
                debugPrint("Network reachable through WiFi")
            //reachabilityStatus = .wifi
            case .cellular:
                NotificationCenter.default.post(name: notificationNameON, object: nil)
                debugPrint("Network reachable through Cellular Data")
                //reachabilityStatus = .cellular
            }
        }
    }
    
    /// Starts monitoring the network availability status
    func startMonitoring() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: Notification.Name.reachabilityChanged,
                                               object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            debugPrint("Could not start reachability notifier")
        }
    }
    
    /// Stops monitoring the network availability status
    func stopMonitoring() {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: Notification.Name.reachabilityChanged,
                                                  object: reachability)
    }
}
