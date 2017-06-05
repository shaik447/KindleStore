//
//  Models.swift
//  KindleStore
//
//  Created by shaik mulla syed on 6/4/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class Book{
    var Title:String!
    var Author:String!
    var BookCover:UIImage!
    var Pages:[Page]
    
    init(title:String, author:String,bookcover:UIImage,pages:[Page]) {
        self.Title=title
        self.Author=author
        self.BookCover=bookcover
        self.Pages=pages
    }
}

class Page{
    var pageNo:Int!
    var pageText:String!
    
    init(pageNo:Int, pageText:String) {
        self.pageNo=pageNo
        self.pageText=pageText
    }
}
