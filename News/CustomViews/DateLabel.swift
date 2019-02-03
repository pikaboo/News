//
//  DateLabel.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

@IBDesignable
class DateLabel: UILabel {

    fileprivate var timer:Timer!
    fileprivate var date:Date!
    fileprivate var dateFormatter:DateFormatter! = DateFormatter()
    
    @IBInspectable
    var dateFormat: String! {
        didSet {
           self.dateFormatter.dateFormat = self.dateFormat
           self.updateView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.date = Date()
        self.updateView()
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.initialize()
    }
    
    fileprivate func initialize(){
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.date = Date()
        self.font = UIFont.monospacedDigitSystemFont(ofSize: self.font.pointSize, weight: .regular)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview:newSuperview)
        if superview == nil {
            self.startTheTimer()
        }else {
            self.stopTheTimer()
        }
    }
    
    func startTheTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {[weak self] (timer) in
            self?.date = self?.date.addingTimeInterval(1)
            self?.updateView()
        })
    }
    
    func stopTheTimer(){
        self.timer.invalidate()
        self.timer = nil
    }

    func updateView(){
        self.text = self.dateFormatter.string(from: self.date)
        self.sizeToFit()
    }
}
