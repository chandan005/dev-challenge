//
//  ProductViewController.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa


final class ProductListViewController: ASViewController<ASDisplayNode>, ActivityIndicator {
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Properties
    //-------------------------------------------------------------------------------------------
    var activityIndicator: UIActivityIndicatorView { get { return self.spinner } }
    var spinner = UIActivityIndicatorView()
    
    let collectionNode: ASCollectionNode = {
        let fl = UICollectionViewFlowLayout()
        fl.minimumLineSpacing = 8
        fl.scrollDirection = .vertical
        fl.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        let c = ASCollectionNode(collectionViewLayout: fl)
        c.backgroundColor = UIColor.collectionViewBackgroundColor
        return c
    }()
    
    var viewModel: ProductListControllerViewModel
    //-------------------------------------------------------------------------------------------
    // MARK: - Initializer
    //-------------------------------------------------------------------------------------------
    init(){
        viewModel = ProductListControllerViewModel()
        super.init(node: collectionNode)
        collectionNode.setTuningParameters(ASRangeTuningParameters(leadingBufferScreenfuls: 2, trailingBufferScreenfuls: 1), for: .preload)
        collectionNode.setTuningParameters(ASRangeTuningParameters.init(leadingBufferScreenfuls: 1.5, trailingBufferScreenfuls: 1), for: .display)
        collectionNode.leadingScreensForBatching = 10.0
    }
    
    private func makeNavigationItemTitleView(){
        let mutableText = NSMutableAttributedString()
        mutableText.append(NSAttributedString(string: viewModel.filerType, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        let label = UILabel()
        label.attributedText = mutableText
        label.numberOfLines = 1
        navigationItem.titleView = label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Override
    //-------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionNode.view.showsVerticalScrollIndicator = false
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.asyncRepeater(apiPath: "/api/products/1")
        self.showActivityIndicator()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.hideActivityIndicator()
            strongSelf.makeNavigationItemTitleView()
            strongSelf.collectionNode.delegate = strongSelf
            strongSelf.collectionNode.dataSource = strongSelf
            strongSelf.collectionNode.registerSupplementaryNode(ofKind: UICollectionView.elementKindSectionFooter)
        })
        
    }
}

extension ProductListViewController: ASCollectionDelegateFlowLayout {
    func collectionNode(_ collectionNode: ASCollectionNode, sizeRangeForFooterInSection section: Int) -> ASSizeRange {
        return ASSizeRangeUnconstrained
    }
}

extension ProductListViewController: ASCollectionDelegate {
    func collectionNode(_ collectionNode: ASCollectionNode, nodeForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> ASCellNode {
        let cell = ProductCollectionFooterViewCell("Average Cubic Weight: " + String(viewModel.getAaverageCubicWeightOfProducts()))
        return cell
     }
}

extension ProductListViewController: ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfProducts()
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let product = viewModel.getItem(at: indexPath)
        return {
            let cell = ProductCollectionViewCell(product)
            return cell
        }
    }
}




