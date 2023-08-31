//
//  URLRequest+Debug.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/06.
//

import Foundation

extension URLRequest {
    
  func debug(with data: Data? = nil) {
    print("REQUEST:")
    print("==================")
    print("\(self.httpMethod ?? "No HTTP Method") \(self.url)")
    print("Headers:")
    print(self.allHTTPHeaderFields ?? "No HTTP Header Fields")
    print("Body:")
    print(String(data: self.httpBody ?? Data(), encoding: .utf8))

    print("RESPONSE:")
    print("==================")
    if let data = data {
      print(NSString(data: data, encoding: NSUTF8StringEncoding) ?? "data format incorect")
    } else {
      print("No data")
    }
    print("END")
    print("==================")
  }
}
