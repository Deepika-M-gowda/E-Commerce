//
//  EcommerceApiManger.swift
//  E Commerce
//
//  Created by Joice George on 28/04/23.
//

import Foundation

class ApiManger: NSObject {
    func fetchData(handler: @escaping ([Keys]) -> Void)
    {
        let urlString = "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
        let url = URL(string: urlString)
        let defaultSession = URLSession(configuration: .default)
        let dataTask = defaultSession.dataTask(with: url!) {
            (data: Data?, response: URLResponse?,error: Error?) in
            
            if(error != nil)
            {
                print(error!)
                return
            }
            
            do
            {
                let json = try JSONDecoder().decode(ResponseModel.self, from: data!)
//                print("Joice", json.homeData.first(where: { $0.type == "banners" })?.values.map {$0.id})
//                print("Joice", json.homeData.first(where: { $0.type == "banners" }))
                let aray = json.homeData.first(where: { $0.type == "banners" })?.values
//                print("type is", type(of: aray))

                handler(json.homeData)
//                let categories = json.homeData.first(where: { $0.type == "banners" })?.values ?? []
//                print("category")
            }
            catch
            {
                print(error)
                return
            }
            
            
        }
        dataTask.resume()
    }
}
