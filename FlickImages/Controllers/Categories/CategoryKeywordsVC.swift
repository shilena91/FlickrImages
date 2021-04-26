//
//  CategorizeKeywordsVC.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import UIKit

final class CategoryKeywordsVC: FIBaseTableVC {
    
    private var keywordsViewModel: CategoryKeywordViewModel?
    private var dataSource: CategoriesDataSource<CategoryKeywordViewModel>?
    
    init(keywords: KeywordsProtocol) {
        super.init(nibName: nil, bundle: nil)
        
        self.keywordsViewModel = CategoryKeywordViewModel(keywords: keywords)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = keywordsViewModel?.getTitle()
        
        tableView.delegate = self
        dataSource = CategoriesDataSource(categories: keywordsViewModel!)
        tableView.dataSource = dataSource
    }
    
}

// MARK: - TableView Delegate

extension CategoryKeywordsVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let keyword = keywordsViewModel?.getItem(byPosition: indexPath.row) {
            NotificationCenter.default.post(name: Notification.Name(NotificationConstant.getKeywordName), object: nil, userInfo: [NotificationConstant.getKeywordKey: keyword])
        }
        
        dismiss(animated: true)
    }
    
}
