//
//  ProductCollectionFooterViewCell.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/11/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import AsyncDisplayKit

final class ProductCollectionFooterViewCell: ASCellNode {
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Properties
    //-------------------------------------------------------------------------------------------
    let avgCubicWeight: ASTextNode
    var value: String
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Initializer
    //-------------------------------------------------------------------------------------------
    init(_ value: String) {
        avgCubicWeight = ASTextNode()
        self.value = value
        super.init()
        setupNodes()
        buildNodeHierarchy()
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Override
    //-------------------------------------------------------------------------------------------

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let mainStack = ASStackLayoutSpec.vertical()
        mainStack.children = [avgCubicWeight]
        mainStack.justifyContent = .center
        mainStack.spacing = 8
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8), child: mainStack)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Methods
    //-------------------------------------------------------------------------------------------
    
    private func makeAvgCubicWeight(){
        let type = NSAttributedString(string: value, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.black])
        avgCubicWeight.attributedText = type
    }
    

    private func buildNodeHierarchy(){
        addSubnode(avgCubicWeight)
    }
    
    private func setupNodes(){
        backgroundColor = UIColor.white
        style.preferredSize = CGSize(width: Constant.Device.width, height: CGFloat(100))
        makeAvgCubicWeight()
    }
}

