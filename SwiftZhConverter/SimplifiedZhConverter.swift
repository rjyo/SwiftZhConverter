//
//  SimplifiedZhConverter.swift
//  SwiftZhConverter
//

import Foundation

public class SimplifiedZhConverter : ZhConverter {
    public init() {
        
    }
    
    public func convert(rawText: String) -> String {
        let location = NSBundle(identifier: "SwiftZhConverter")?.resourcePath!.stringByAppendingString("/word_t2s.txt")
        
        var mappingTable = Dictionary<Character, Character>();
        if let reader = StreamReader(path: location!) {
            while let line = reader.nextLine() {
                var tokens = line.characters.split {$0 == ","}.map { String($0) }
                let token1 = tokens[0]
                let token2 = tokens[1]
                mappingTable[token1[0]] = token2[0]
            }
        }
        
        var newText = "";
        for char in rawText.characters {
            if let tc = mappingTable[char] {
                newText.append(tc);
            } else {
                newText.append(char)
            }
        }
        
        return newText;
    }
}