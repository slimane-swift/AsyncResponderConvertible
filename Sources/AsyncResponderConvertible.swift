//
//  AsyncResponderConvertible.swift
//  AsyncResponderConvertible
//
//  Created by Yuki Takei on 4/20/16.
//
//

import S4

public protocol AsyncResponderConvertible {
    func respond(_ response: Response, result: ((Void) throws -> Response) -> Void)
}

extension Response {
    public var customResponder: AsyncResponderConvertible? {
        return self.storage["Slimane.Internal.CustomResponder"] as? AsyncResponderConvertible
    }

    public init (custom customResponder: AsyncResponderConvertible){
        self.init()
        self.storage["Slimane.Internal.CustomResponder"] = customResponder
    }
}
