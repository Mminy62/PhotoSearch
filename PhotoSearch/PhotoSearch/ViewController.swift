//
//  ViewController.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/18/25.
//

import UIKit
import Alamofire

class ViewController: BaseViewController {
    
    let searchTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        callRequest()
    }
    
    func callRequest() {
        let url = "https://api.unsplash.com/search/photos?query=flower&page=1&per_page=1&order_by=latest&color=yellow&client_id=\(APIKey.search.value)"

        AF.request(url, method: .get)
            .responseDecodable(of: SearchData.self) { response in
            switch response.result {
                
            case .success(let value):
                dump(value)
            case .failure(let error):
                print(error)
            }
        }
        
        
    }

}

