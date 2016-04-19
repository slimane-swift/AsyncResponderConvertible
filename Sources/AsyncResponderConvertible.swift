//
//  AsyncResponderConvertible.swift
//  AsyncResponderConvertible
//
//  Created by Yuki Takei on 4/20/16.
//
//

import S4

public protocol AsyncResponderConvertible {
    func respond(response: Response, result: (Void throws -> Response) -> Void)
}

extension Response {
    public var customeResponder: AsyncResponderConvertible? {
        return self.storage["Slimane.Internal.CustomeResponder"] as? AsyncResponderConvertible
    }

    public init (custome customeResponder: AsyncResponderConvertible){
        self.init()
        self.storage["Slimane.Internal.CustomeResponder"] = customeResponder
    }
}
