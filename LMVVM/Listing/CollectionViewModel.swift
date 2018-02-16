//
//  CollectionViewModel.swift
//  BuddyBook
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 29/01/18.
//  Copyright © 2018 Bruno Miguêns. All rights reserved.
//

import UIKit

open class CollectionViewModel<T, C> where T: GenericItemProtocol, C: GenericCellProtocol, C: UICollectionViewCell {

    public typealias ModelType = T
    public typealias DataViewModelHandler = (CollectionViewModel<T, C>) -> Void

    fileprivate let cellIdentifier: String
    fileprivate var dataHandler: DataViewModelHandler?

    fileprivate var data: DataViewModel<ModelType> = DataViewModel(source: []) {
        didSet {
            dataHandler?(self)
        }
    }

    public init(cellIdentifier: String, data: DataViewModel<ModelType>? = nil) {
        self.cellIdentifier = cellIdentifier

        if let source = data {
            self.data = source
        }
    }

}

extension CollectionViewModel {

    public func bind(handler: DataViewModelHandler?) {
        dataHandler = handler
    }

    public func update(collection: DataViewModel<ModelType>) {
        self.data = collection
    }

}

extension CollectionViewModel {

    public var numberOfRows: Int {
        return data.count
    }

    public func cell(on collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        guard var cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? C else {
            return UICollectionViewCell()
        }

        if let viewModel = data.index(of: indexPath.row) as? C.ModelType {
            cell.viewModel = viewModel
        }

        return cell
    }

}
