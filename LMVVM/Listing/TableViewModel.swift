//
//  TableViewModel.swift
//  BuddyBook
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 29/01/18.
//  Copyright © 2018 Bruno Miguêns. All rights reserved.
//

import UIKit

open class TableViewModel<T, C> where T: GenericItemProtocol, C: GenericCellProtocol, C: UITableViewCell {

    public typealias ModelType = T
    public typealias DataViewModelHandler = (TableViewModel<T, C>) -> Void

    fileprivate let cellIdentifier: String
    fileprivate var dataHandler: DataViewModelHandler?

    fileprivate var data: DataViewModel<ModelType> = DataViewModel(source: []) {
        didSet {
            dataHandler?(self)
        }
    }

    public init(cellIdentifier: String, collection: DataViewModel<ModelType>? = nil) {
        self.cellIdentifier = cellIdentifier

        if let data = collection {
            self.data = data
        }
    }

}

extension TableViewModel {

    public func bind(handler: DataViewModelHandler?) {
        dataHandler = handler
    }

    public func update(collection: DataViewModel<ModelType>) {
        self.data = collection
    }

}

extension TableViewModel {

    public var numberOfRows: Int {
        return data.count
    }

    public func cell(on tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? C else {
            return UITableViewCell()
        }

        if let viewModel = data.index(of: indexPath.row) as? C.ModelType {
            cell.viewModel = viewModel
        }

        return cell
    }

}
