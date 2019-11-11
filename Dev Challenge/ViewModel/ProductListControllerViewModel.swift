//
//  ProductListControllerViewModel.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//
import RxSwift
import RxCocoa

final class ProductListControllerViewModel {
    
    private var productViewModelList = [ProductCollectionViewCellModel]()
    let filerType = "Air Conditioners"
    let disposeBag = DisposeBag()
    init() {
    }
    
    func numberOfProducts() -> Int {
        return productViewModelList.count
    }
    
    func getItem(at indexPath: IndexPath) -> ProductCollectionViewCellModel {
        return productViewModelList[indexPath.item]
    }
    
    
    func getProducts(apiPath: String, completion: @escaping(_ nextR: String) -> ()) {
        let request = ProductRouter.getProducts(next: apiPath)
        ProductService.request(withRequest: request)
        .subscribe(
            onNext: { [weak self] products in
                guard let strongSelf = self else { return }
                guard products.count > 0 else {
                    completion("")
                    return
                }
                guard let nextCall = products[0].nextRequest else {
                    completion("")
                    return
                }
                let productResponse = products.filter{$0.category == strongSelf.filerType}
                for product in productResponse {
                    strongSelf.productViewModelList.append(ProductCollectionViewCellModel(product))
                }
                completion(nextCall)
            }
        ).disposed(by: disposeBag)
    }
    
    func asyncRepeater(apiPath: String) {
        getProducts(apiPath: apiPath, completion: { [weak self] nextR in
            guard let strongSelf = self else { return }
            if !nextR.isEmpty {
                strongSelf.asyncRepeater(apiPath: nextR)
            }
        })
    }
    
    func getAaverageCubicWeightOfProducts() -> Double {
        let numberOfProducts = productViewModelList.count
        var totalCubicWeight = 0.0
        for viewmodel in productViewModelList {
            totalCubicWeight += viewmodel.cubicWeight
        }
        return (totalCubicWeight / Double(numberOfProducts)).rounded(toPlaces: 3)
    }
}
