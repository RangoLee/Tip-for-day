//
//  Document.swift
//  MDocumentDemo
//
//  Created by alexiuce  on 2017/6/26.
//  Copyright © 2017年 com.Alexiuce. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    var readText : String?
    
    weak var contextController : ViewController!
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }
    // 自动保存功能
    override class func autosavesInPlace() -> Bool {
        return true
    }
    // 加载文档关联的视图控制器： 也就是显示文档内容或保存其内容 对应的的视图控制器（可以有多个）
    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        self.addWindowController(windowController)
        contextController = windowController.contentViewController as! ViewController
        if readText != nil {
            contextController.textView.string = readText
        }
        
    }
   // 保存文档时，系统调用此方法
    override func data(ofType typeName: String) throws -> Data {
        let saveText = contextController.textView.string ?? ""
        return saveText.data(using: .utf8)!
        
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
//        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
   // 打开文档时，系统调用此方法
    override func read(from data: Data, ofType typeName: String) throws {
        readText = String(data: data, encoding: .utf8)
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
//        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
    


}

