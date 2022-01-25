//
//  HaveViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import Foundation

protocol HaveViewModel: HaveAnyViewModel {
    associatedtype ViewModel

    var viewModel: ViewModel? { get set }
    
    func viewModelChanged(_ viewModel: ViewModel)
}

protocol HaveAnyViewModel: AnyObject {
    var anyViewModel: Any? { get set }
}
