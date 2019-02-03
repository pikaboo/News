//
//  EventBus.swift
//  News
//
//  Created by Lena Brusilovski on 03/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit
import SwiftEventBus
/*
 This extension was created to keep an easy possibility to replace the SwiftEventBus with some other implementation
 removing the need to write `import SwiftEventBus` where ever it is used
 I have overriden only the methods that i actually need. In a much bigger application i would have overriden all of the methods
 */
extension NSObject {

    /*
     Post an event to the system for all who is listening to react
     @param name : the name of the event
     @param sender: the sender of the event
     @param userInfo: if any extra data is sent with it
     */
    func post(_ name: String, sender: Any? = nil, userInfo: [AnyHashable: Any]? = nil) {
        SwiftEventBus.post(name,sender:sender,userInfo:userInfo)
    }
    
    /**
     * listen for an event on the main thread
     * @param target : the receiver of the event
     * @param name: the name of the event
     * @param sender: the sender
     * @param handler: to be executed when the event arrives
     */
    @discardableResult
    func onMainThread(_ target: AnyObject, name: String, sender: Any? = nil, handler: @escaping ((Notification?) -> Void)) -> NSObjectProtocol {
        return SwiftEventBus.onMainThread(target, name: name, sender: sender, handler: handler)
    }
    
    /**
     * unregister the registered target
     * any target that calls onMainThread needs to be unregistered, otherwise the target may leak the event listener
     */
    func unregisterFromEvents(_ target: AnyObject){
        SwiftEventBus.unregister(target)
    }
    /**
     * unregister the registered target from specific event name
     * any target that calls onMainThread needs to be unregistered, otherwise the target may leak the event listener
     */
    func unregisterFromEvents(_ target: AnyObject, name: String) {
        SwiftEventBus.unregister(target, name:name)
    }
}
