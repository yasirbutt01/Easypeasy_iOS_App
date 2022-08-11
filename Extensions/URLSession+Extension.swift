//
//  URLSession+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 23/10/2020.
//

import Foundation

extension URLSession {
    
    func cancelRequest(withURL urlString:String) -> Void {
        session.getAllTasks { (sessionTasksList) in
            sessionTasksList.forEach({ (sessionTask) in
                if let url = sessionTask.originalRequest?.url {
                    if url.absoluteString.contains(urlString) {
                        sessionTask.cancel()
                    }
                }
            })
        }
    }
}
