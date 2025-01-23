//
//  DetailViewController.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/23/25.
//

import UIKit

class DetailViewController: BaseViewController {
    var id: String
    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        print(id ?? "없음")
        
    }
}
