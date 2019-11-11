//
//  ProductCollectionHeaderViewCell.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/11/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import AsyncDisplayKit

final class ProductCollectionHeaderViewCell: ASCellNode {
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Properties
    //-------------------------------------------------------------------------------------------
    let category: ASTextNode
    var categoryTitle: String
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Initializer
    //-------------------------------------------------------------------------------------------
    init(_ categoryTitle: String) {
        category = ASTextNode()
        self.categoryTitle = categoryTitle
        super.init()
        setupNodes()
        buildNodeHierarchy()
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Override
    //-------------------------------------------------------------------------------------------

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let mainStack = ASStackLayoutSpec.vertical()
        mainStack.children = [category]
        mainStack.justifyContent = .start
        mainStack.spacing = 8
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8), child: mainStack)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Methods
    //-------------------------------------------------------------------------------------------
    
    private func makeCategory(){
        let type = NSAttributedString(string: categoryTitle, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.black])
        category.attributedText = type
    }
    

    private func buildNodeHierarchy(){
        addSubnode(category)
    }
    
    private func setupNodes(){
        backgroundColor = UIColor.white
        style.preferredSize = CGSize(width: Constant.Device.width, height: CGFloat(100))
        makeCategory()
    }
}
