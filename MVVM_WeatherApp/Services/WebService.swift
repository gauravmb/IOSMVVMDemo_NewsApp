//
//  WebService.swift
//  MVVM_WeatherApp
//
//  Created by M1092828 on 08/08/22.
//

import Foundation

struct Resource<T>
{
    let url:URL
    let parse:(Data)->T?
}

final class WebService:NSObject {
    func load<T>(resource:Resource<T>,completion:@escaping (T?)->()){
        
        let configutation = URLSessionConfiguration.default
        let session = URLSession(configuration: configutation, delegate: self, delegateQueue: nil)
        session.dataTask(with: resource.url) { data, response , error in
            
            if let data = data{
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            }
            else {
                completion(nil)
            }
        }.resume()
    }
}

extension WebService:URLSessionDelegate {

    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void)
   {
           guard let serverTrust = challenge.protectionSpace.serverTrust else {
               return completionHandler(URLSession.AuthChallengeDisposition.useCredential, nil)
           }
           return completionHandler(URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust: serverTrust))
   }

}
