//
//  ViewController.swift
//  Boogie1
//
//  Created by Arvind Subramanian on 6/14/15.
//  Copyright (c) 2015 iOS Boogie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // this code reads a file and calls your function!
        // to test a big file, change the word 'small' to 'alice'
        if let filePath = NSBundle.mainBundle().pathForResource("small", ofType: "txt"), contents = NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding, error: nil) {
            findTheDuplicates(contents as String)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    function that counts
    how often each word appears in the text and prints:
    word1 count1
    word2 count2
    ...
    
    Print the above list in order sorted by word (swift will sort punctuation to
    come before letters -- that's fine). Store all the words as lowercase,
    so 'The' and 'the' count as the same word.
    */
    func findTheDuplicates(fileContents: String) {
        let words = split(fileContents) { $0 == " "} // splits up the text into words
        
        var wordCounter = [String:Int]() // creates an array to hold on to the counts of each word
        
        for word in words {
            // removes all whitespace around a word
            let trimmedWord = word.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            
            // makes a word lowercase
            let downcasedWord = trimmedWord.lowercaseString
            
            // if the word hasn't been tracked yet, we initialize an entry for it to zero
            // it would have looked liek wordCounter["word"] -> nil
            // this block makes it wordCounter["word"] -> 0
            if wordCounter[downcasedWord] == nil {
                wordCounter[downcasedWord] = 0
            }
            
            // because dictionaries may not have values for a given key, we have to unwrap the optional when we increment by 1
            wordCounter[downcasedWord]! += 1
        }
        
        // sort all the words in alphabetical order
        let sortedWords = Array(wordCounter.keys).sorted(<)
        
        // now that we have them sorted, we just walk through the sorted order
        for word in sortedWords {
            // get the count for each word in the dictionary we created earlier
            if let count = wordCounter[word] {
                // print it!
                println("\(word) \(count)")
            }
        }
        
        
    }
    
}

