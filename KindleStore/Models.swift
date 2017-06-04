//
//  Models.swift
//  KindleStore
//
//  Created by shaik mulla syed on 6/4/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import Foundation

class Book{
    var Title:String!
    var Author:String!
    var Pages:[Page]
    
    init(title:String, author:String,pages:[Page]) {
        self.Title=title
        self.Author=author
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
