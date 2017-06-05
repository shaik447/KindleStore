//
//  BookCell.swift
//  KindleStore
//
//  Created by shaik mulla syed on 9/10/1438 AH.
//  Copyright © 1438 shaik mulla syed. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell{
    
    var book:Book?{
        didSet{
            BookCover.image=book?.BookCover
            titleLabel.text=book?.Title
            authorLabel.text=book?.Author
        }
    }
    
    private var BookCover:UIImageView = {
        let uiimageview=UIImageView()
        uiimageview.translatesAutoresizingMaskIntoConstraints=false
//        uiimageview.layer.cornerRadius=5.0
//        uiimageview.layer.masksToBounds=true
        return uiimageview
    }()
    
    private var titleLabel:UILabel={
        let label=UILabel()
        label.text="This is the big title for the title in the first row"
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    
    private var authorLabel:UILabel={
        let label=UILabel()
        label.text="This is the big title for the title in the second row"
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        
        addSubview(BookCover)
        BookCover.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive=true
        BookCover.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive=true
        BookCover.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive=true
        BookCover.widthAnchor.constraint(equalToConstant: 50).isActive=true
        
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: BookCover.rightAnchor, constant: 8).isActive=true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive=true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive=true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive=true
        
        addSubview(authorLabel)
        authorLabel.leftAnchor.constraint(equalTo: BookCover.rightAnchor, constant: 8).isActive=true
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive=true
        authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive=true
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive=true
        
        //print(UIScreen.main.bounds.height)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
