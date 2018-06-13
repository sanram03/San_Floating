//
//  SanFloatingView.swift
//  San_Floating
//
//  Created by Rim global on 13/06/18.
//  Copyright © 2018 Rim global. All rights reserved.
//

import UIKit

protocol SanFloatingTextDelegate {
    func getText(text: String)
}

@IBDesignable class SanFloatingView: UIView
{
    private var headerTitle : String = ""
    @IBInspectable
    public var title : String = "Name" {
        
        didSet{
            headerTitle = self.title
        }
    }
    
    @IBInspectable
    public var color : UIColor = .clear {
        
        didSet{
            self.backgroundColor = self.color
        }
    }
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    var textField : UITextField = {
        let txtField = UITextField()
        
        return txtField
    }()
    
    var bottomLayer : CALayer{
        let bottomLine = CALayer()
        bottomLine.backgroundColor = UIColor.black.cgColor
        bottomLine.frame = CGRect(x: 0, y: self.bounds.height-1, width: self.bounds.width, height: 1)
        return bottomLine
    }
    
    var delegate : SanFloatingTextDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("inside init frame")
        setUpView()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    func setUpView()
    {
        
        self.backgroundColor = .clear
        self.layer.addSublayer(bottomLayer)
        self.layer.cornerRadius = 5
        titleLabel.frame = CGRect(x: 0, y: 20, width: self.bounds.width, height: 20)
        self.addSubview(titleLabel)
        titleLabel.isHidden = true
        textField.placeholder = headerTitle
        textField.frame = CGRect(x: 0, y: 18, width: self.bounds.width, height: self.bounds.height-20)
        textField.delegate = self
        self.addSubview(textField)
    }
    
}

extension SanFloatingView: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        UIView.animate(withDuration: 1.0, animations: {
            self.titleLabel.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 20)
            textField.placeholder = ""
        })
            titleLabel.isHidden = false
            titleLabel.text = headerTitle
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        if (textField.text?.isEmpty)!
        {
            self.titleLabel.frame = CGRect(x: 0, y: 20, width: self.bounds.width, height: 20)
            self.titleLabel.isHidden = true
            textField.placeholder = headerTitle
        }
        else
        {
            delegate?.getText(text: textField.text!)
        }
    }
    
    
}
