//
//  Input.swift
//
//
//  Created by Tyler Milner on 12/1/23.
//

import Foundation

public struct Input {
    public let fileName: String
    public let bundle: Bundle
    
    public var fileUrl: URL {
        guard let url = bundle.url(forResource: fileName, withExtension: "txt") else {
            fatalError("Unable to find input file: \(fileName)")
        }
        return url
    }
    
    public var fileLines: [String] {
        get throws {
            try FileReader.readLines(from: fileUrl)
        }
    }
    
    public init(fileName: String, bundle: Bundle) {
        self.fileName = fileName
        self.bundle = bundle
    }
}
