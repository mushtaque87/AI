//
//  DataManager.swift
//  AI
//
//  Created by Philips on 23/08/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class DataManager: NSObject {

    
    func readfile(filename: String) -> String {
        
        let file = filename//this is the file. we will write to and read from it
        
        let text = "" //just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent(file)
            
//            //writing
//            do {
//                try text.write(to: path, atomically: false, encoding: String.Encoding.utf8)
//            }
//            catch {/* error handling here */}
            
            //reading
            do {
                let text = try String(contentsOf: path, encoding: String.Encoding.utf8)
            }
            catch {/* error handling here */}
        }
        return text
    }
    
}
