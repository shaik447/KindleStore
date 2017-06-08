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
    
    init(bookdictionary:[String:Any]) {
        self.Title=(bookdictionary["title"] as? String) ?? ""
        self.Author=(bookdictionary["author"] as? String) ?? ""
        self.BookCover=nil
        var tmpPages=[Page]()
        if let pageDictionaries=bookdictionary["pages"] as? [[String:Any]]{
            for pagedict in pageDictionaries{
                let tmpPage=Page(pageNo: 0, pageText: (pagedict["text"] as? String) ?? "")
                tmpPages.append(tmpPage)
            }
        }
        self.Pages=tmpPages
        
        let imageUrlstring=(bookdictionary["coverImageUrl"] as? String) ?? ""
        let imageurl=URL(string: imageUrlstring)
        if let imgurl=imageurl{
            do{
                let coverdata=try Data(contentsOf: imgurl)
                self.BookCover=UIImage(data: coverdata)
            }catch let err{
                print(err)
            }
        }
        
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
