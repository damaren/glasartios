//
//  Serializable.swift
//  Glasart
//
//  Created by Damaren on 07/03/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public protocol Serializable : Codable {
    init?(json:String)
    init?(json:Data)
    func serialize() -> Data?
}

extension Serializable {
    
    public init?(json:Data) {
        let decoder = JSONDecoder()
        guard let value = try? decoder.decode(Self.self, from: json) else { return nil }
        self = value
    }
    
    public init?(json:String) {
        let decoder = JSONDecoder()
        guard let data = json.data(using: .utf8), let value = try? decoder.decode(Self.self, from: data) else { return nil }
        self = value
    }
    
    public func serialize() -> Data? {
        let coder = JSONEncoder()
        return try? coder.encode(self)
    }
}
