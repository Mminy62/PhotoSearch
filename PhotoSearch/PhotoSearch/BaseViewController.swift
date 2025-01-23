//
//  BaseViewController.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/19/25.
//

import UIKit

class BaseViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configureHierachy()
        configureLayout()
        configureView()
    }
    
    func configureHierachy() { }
    func configureLayout() { }
    func configureView() { }
}
