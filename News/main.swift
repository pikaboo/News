//
//  main.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

let appDelegateClass: AnyClass? =
    NSClassFromString("NewsTests.TestsAppDelegate") ?? AppDelegate.self
let args = CommandLine.unsafeArgv
_ = UIApplicationMain(CommandLine.argc, args, nil, NSStringFromClass(appDelegateClass!))
