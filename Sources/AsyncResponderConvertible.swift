//
//  AsyncResponderConvertible.swift
//  AsyncResponderConvertible
//
//  Created by Yuki Takei on 4/20/16.
//
//

import S4

private let key = "Slimane.Internal.CustomResponder"

public protocol AsyncResponderConvertible {
    func respond(_ response: Response, result: @escaping ((Void) throws -> Response) -> Void)
}

extension Response {
    public var customResponder: AsyncResponderConvertible? {
        return self.storage[key] as? AsyncResponderConvertible
    }

    public init (version: Version = Version(major: 1, minor: 1), status: Status = .ok, headers: Headers = [:], cookieHeaders: Set<String> = [], custom customResponder: AsyncResponderConvertible){
        self.init(version: version, status: status, headers: headers, cookieHeaders: cookieHeaders, body: .buffer(Data()))
        self.storage[key] = customResponder
    }
}
