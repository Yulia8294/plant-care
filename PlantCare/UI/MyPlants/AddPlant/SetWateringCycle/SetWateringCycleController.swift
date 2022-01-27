//
//  SetWateringCycleController.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/26/22.
//

import UIKit
import Combine

class SetWateringCycleController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var viewModel: ChooseWateringCycleViewModel!
        
    private var bindings = Set<AnyCancellable>()
    
    lazy var backgroundImageView: UIImageView = {
        let view = UIImageView(image: R.image.watercolor1()!)
        view.contentMode = .scaleAspectFill
        view.alpha = 0.3
       return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell(WateringCell.self)
        tableView.backgroundView = backgroundImageView
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.screenWillAppear()
    }
    
    private func bindViewModel() {
        title = viewModel.title

        viewModel.reload = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension SetWateringCycleController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cycles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.cell(WateringCell.self).setup(with: viewModel.getCycle(for: indexPath))
    }
}


extension SetWateringCycleController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}
