//
//  ThemeButtonView.swift
//  MiMelons
//
//  Created by Sophie Qin on 2019-09-14.
//  Copyright © 2019 Sophie Qin. All rights reserved.
//

import UIKit

class ThemeButtonView: UIView {
    let button = UIButton(frame: CGRect(x: 21, y: 0, width: 333, height: 59))
    
    var onTap: (()->())? {
        didSet {
            button.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
        }
    }
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        addSubview(button)
        button.backgroundColor = UIColor(red: 190/255, green: 206/255, blue: 139/255, alpha: 1)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 30
        button.layer.shadowColor = UIColor(red: 190/255, green: 206/255, blue: 139/255, alpha: 0.39).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 7)
        button.layer.shadowRadius = 15 / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onClick(_ sender: UIButton) {
        guard let closure = onTap else { return }
        closure()
    }
    
}
