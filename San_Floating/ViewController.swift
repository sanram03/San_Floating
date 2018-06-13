//
//  ViewController.swift
//  San_Floating
//
//  Created by Rim global on 13/06/18.
//  Copyright © 2018 Rim global. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var txtField: SanFloatingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let floatr = SanFloatingView(frame: CGRect(x: 40, y: 60, width: 150, height: 50))
        floatr.delegate = self
        
        floatr.title = "Second Name"
        self.view.addSubview(floatr)
        txtField.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension ViewController: SanFloatingTextDelegate
{
    func getText(text: String) {
        print("text is \(text)")
    }
}

