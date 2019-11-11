//
//  ProductCollectionViewCell.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import AsyncDisplayKit

final class ProductCollectionViewCell: ASCellNode {
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Properties
    //-------------------------------------------------------------------------------------------
    let cubicWeight: ASTextNode
    let title:ASTextNode
    fileprivate var viewModel: ProductCollectionViewCellModel
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Initializer
    //-------------------------------------------------------------------------------------------
    init(_ viewModel: ProductCollectionViewCellModel) {
        cubicWeight = ASTextNode()
        title = ASTextNode()
        self.viewModel = viewModel
        super.init()
        setupNodes()
        buildNodeHierarchy()
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Override
    //-------------------------------------------------------------------------------------------

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let mainStack = ASStackLayoutSpec.vertical()
        mainStack.children = [title, cubicWeight]
        mainStack.justifyContent = .start
        mainStack.spacing = 20
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8), child: mainStack)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Methods
    //-------------------------------------------------------------------------------------------
    
    private func makeCubicWeight(){
        let type = NSAttributedString(string: "Cubic Weight of product: " + String(viewModel.cubicWeight), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black])
        cubicWeight.attributedText = type
    }
    
    private func makeTitle() {
        let proudctTitle = NSAttributedString(string: viewModel.title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black])
        title.attributedText = proudctTitle
    }

    private func buildNodeHierarchy(){
        addSubnode(cubicWeight)
        addSubnode(title)
    }
    
    private func setupNodes(){
        backgroundColor = UIColor.white
        style.preferredSize = CGSize(width: Constant.Device.width, height: CGFloat(100))
        makeCubicWeight()
        makeTitle()
    }
}

