//
//  ViewController.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 04/02/23.
//

import UIKit

class ViewController: UIViewController {

    private var data: [MoviesItem] = []
    private let loader: MoviesLoader?

    init(with loader: MoviesLoader?) {
        self.loader = loader
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = tableView
        title = "Movies Top Rated"
        tableView.delegate = self
        tableView.dataSource = self

        guard let loader = loader else { return }
        loader.load { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let movies):
                self.updateData(with: movies)
            case .failure(let error):
                print("Handle Error: \(error.localizedDescription)")
            }
        }
    }

    private func updateData(with movies: [MoviesItem]) {
        DispatchQueue.main.async {
            self.data.append(contentsOf: movies)
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell.textLabel?.text = data[indexPath.row].title
            return cell
        }
        fatalError("could not dequeueReusableCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
