//
//  EditDistanceConverter+UICollectionView.swift
//  EditDistance
//
//  Created by Kazuhiro Hayashi on 2/19/17.
//  Copyright © 2017 Kazuhiro Hayashi. All rights reserved.
//

import UIKit

public extension EditScriptConverterProxy where Converter: UICollectionView {
    
    /// Updates this UICollectionView object with EditDistanceContainer object.
    ///
    /// EditScript array in the object is converted to insertItems(at:) and deleteItems(at:) of UICollectionView
    ///
    /// - Parameters:
    ///   - container: <#container description#>
    ///   - completion: <#completion description#>
    public func performBatchUpdates<T>(with container: EditDistanceContainer<T>, completion: ((Bool) -> Void)?) {
        _converter.performBatchUpdates({ [weak self] in
            container.editScripts.forEach({ (script) in
                switch script {
                case .add(_, let indexPath):
                    self?._converter.insertItems(at: [indexPath])
                case .delete(_, let indexPath):
                    self?._converter.deleteItems(at: [indexPath])
                case .common:
                    break
                }
            })
            }, completion: { (finish) in
                completion?(finish)
        })
    }
}
