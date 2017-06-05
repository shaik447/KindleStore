//
//  BookCell.swift
//  KindleStore
//
//  Created by shaik mulla syed on 9/10/1438 AH.
//  Copyright © 1438 shaik mulla syed. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell{
    
    var BookCover:UIImageView{
        var uiimageview=UIImageView()
        uiimageview.image=#imageLiteral(resourceName: "stevejobs")
        return uiimageview
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        backgroundColor = .yellow
        
        addSubview(BookCover)
        BookCover.frame=CGRect(x: 10, y: 10, width: 50, height: 50)
        BookCover.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
