//
//  CategorizeKeywordsVC.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import UIKit

final class CategoryKeywordsVC: FIBaseTableVC {
    
    private var keywordsViewModel: CategoryKeywordViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    init(keywords: KeywordsProtocol) {
        super.init(nibName: nil, bundle: nil)
        
        self.keywordsViewModel = CategoryKeywordViewModel(keywords: keywords)
        navigationItem.title = keywords.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TableView Delegate and DataSource

extension CategoryKeywordsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keywordsViewModel?.numberOfKeywords() ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
        
        if let keyword = keywordsViewModel?.getKeyword(byPosition: indexPath.row) {
            cell.set(categorizeName: keyword, accessoryType: .none)
        }
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let keyword = keywordsViewModel?.getKeyword(byPosition: indexPath.row) {
            NotificationCenter.default.post(name: Notification.Name(NotificationConstant.getKeywordName), object: nil, userInfo: [NotificationConstant.getKeywordKey: keyword])
        }
        
        dismiss(animated: true)
    }
    
}
