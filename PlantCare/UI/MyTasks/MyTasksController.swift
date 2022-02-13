//
//  MyTasksController.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import Combine
import UIKit

class MyTasksController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var subscriptions = Set<AnyCancellable>()
    private lazy var dataSource = makeDataSource()

    var viewModel: MyTasksViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindToViewModel()
       // viewModel.fetchTasks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchTasks()
    }
    
    private func setupTableView() {
        tableView.registerCell(TaskCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.dataSource = dataSource
    }
    
    private func bindToViewModel() {
        viewModel.$taskCellsViewModels.sink { [weak self] items in
            self?.update(with: items)
        }
        .store(in: &subscriptions)
    }
}

typealias DataSource = UITableViewDiffableDataSource<PlantSection, PlantInfoViewModel>
typealias Snapshot = NSDiffableDataSourceSnapshot<PlantSection, PlantInfoViewModel>

private extension MyTasksController {
    
    func makeDataSource() -> DataSource {
        
        return UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, itemIdentifier in
            return tableView.cell(TaskCell.self)
                .setup(with: self.viewModel.getCellViewModel(at: indexPath))
        }
    }
    
    func update(with list: [PlantInfoViewModel]) {
        var snapshot = Snapshot()
        snapshot.appendSections(PlantSection.allCases)
        snapshot.appendItems(list, toSection: PlantSection.main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func remove(_ item: PlantInfoViewModel) {
        var snapshot = dataSource.snapshot()
        snapshot.deleteItems([item])
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension MyTasksController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = completeAction(for: indexPath, tableView)
        action.image = R.image.check_circle()!
        action.backgroundColor = UIColor.lightAccent
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    private func completeAction(for indexPath: IndexPath, _ tableView: UITableView) -> UIContextualAction {
        return UIContextualAction(style: .normal, title: "Done") { _, _, completion in
            self.viewModel.completeTask(at: indexPath)
        }
    }
}
