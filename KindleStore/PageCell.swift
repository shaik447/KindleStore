//
//  PageCell.swift
//  KindleStore
//
//  Created by shaik mulla syed on 6/8/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
        
    private var PageText:UITextView={
        let textview=UITextView()
        textview.font=UIFont(name: "Avenir", size: 17)
        textview.textColor = UIColor.gray
        textview.translatesAutoresizingMaskIntoConstraints=false
        return textview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .blue
        addSubview(PageText)
        PageText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive=true
        PageText.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive=true
        PageText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive=true
        PageText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive=true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(page:Page?) {
        PageText.text=page?.pageText ?? ""
    }
}
