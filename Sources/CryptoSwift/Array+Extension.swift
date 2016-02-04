//
//  ArrayExtension.swift
//  CryptoSwift
//
//  Created by Marcin Krzyzanowski on 10/08/14.
//  Copyright (c) 2014 Marcin Krzyzanowski. All rights reserved.
//

extension Array {
    
    /** split in chunks with given chunk size */
    func chunks(chunksize:Int) -> [Array<Element>] {
        var words = [[Element]]()
        words.reserveCapacity(self.count / chunksize)        
        for var idx in chunksize...self.count {
            let word = Array(self[idx - chunksize..<idx]) // this is slow for large table
            words.append(word)
            idx = idx + chunksize
        }
        let reminder = Array(self.suffix(self.count % chunksize))
        if (reminder.count > 0) {
            words.append(reminder)
        }
        return words
    }
    
    /*
    This helper call is slow, therefore don't use it. It is due to extension, or due to optimization that can be done
    
    subscript(index: UInt32) -> Element {
        get {
            return self[Int(index)]
        }
        set {
            self[Int(index)] = newValue
        }
    }
    */
}

