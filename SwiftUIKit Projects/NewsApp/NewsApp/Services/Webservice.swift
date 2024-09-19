//
//  Webservice.swift
//  NewsApp
//
//  Created by Seymen Nadir Elmas on 16.09.2024.

import Foundation

class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print(String(data: data, encoding: .utf8) ?? "Veri geçersiz")
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                        completion(articleList?.articles)
                    } else {
                        print("Yanıt kodu: \(httpResponse.statusCode)")
                        completion(nil)
                    }
                }

            

                
                if let articleList = articleList {
                    completion(articleList.articles)
                }else {
                    completion(nil) // Bu satırı ekleyin
                }
                
                
                print(articleList?.articles)
                
            }
            
        }.resume()
        
    }
    
}
