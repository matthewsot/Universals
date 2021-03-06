//
//  WebClient.swift
//  WebClient
//
//  Created by Matthew S on 6/6/14.
//  Copyright (c) 2014 Matthew S. All rights reserved.
//

import Foundation
import Cocoa

enum Something: NSUInteger {
    case Somethin = 1;
    case Another = 2;
}

struct WebClient {
    func GetAsyncString(url: String, handler: (String) -> Void) {
        //Thanks! http://stackoverflow.com/questions/24016142/how-to-make-an-http-request-in-swift
        var request = NSURLRequest(URL: NSURL(string: url))
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler: {(response: NSURLResponse!, data: NSData!, error: NSError!) in
            
            var str: String = NSString(data: data, encoding: NSUTF8StringEncoding);
            handler(str);
            })
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler: {(response, data, error) in
            
            var str: String = NSString(data: data, encoding: NSUTF8StringEncoding);
            handler(str);
            });
        var something: String, something_else: String = "hello";
    }
}