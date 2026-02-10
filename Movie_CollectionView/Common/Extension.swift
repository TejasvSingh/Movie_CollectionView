//
//  Extension.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/9/26.
//

import UIKit

extension UIImageView {
    func loadImage(url: String) async {
        
   
        guard let serverURL = URL(string: url) else {
            print("Log: Invalid URL")
            return self.image = UIImage(systemName: "photo")
        }
        
        do {
          
            let (data, response) = try await URLSession.shared.data(from: serverURL)
            
 
            if let serverResponse = response as? HTTPURLResponse, serverResponse.statusCode != 200 {
                print("Log: No data received from server")
                return self.image = UIImage(systemName: "photo")
            }
            
           
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
        } catch {
            print("Log: Error fetching data from server")
            self.image = UIImage(systemName: "photo")
        }
    }
}
