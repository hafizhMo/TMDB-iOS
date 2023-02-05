//
//  ViewController.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 04/02/23.
//

import UIKit

class ViewController: UIViewController {

    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .systemBackground
        label.textAlignment = .center
        label.text = "Test Label"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController"
        view = label
    }
}
