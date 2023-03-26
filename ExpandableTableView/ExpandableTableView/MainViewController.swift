//
//  MainViewController.swift
//  ExpandableTableView
//
//  Created by 윤병일 on 2023/03/23.
//

import UIKit
import SnapKit

final class MainViewController : UIViewController {
    
    // MARK: - Properties
    private let tableView = UITableView()
    
    private let textData : [String] = ["안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요.", "안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요.", "안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. "]
    
    var expandedCell : IndexSet = [] // 늘어날 셀의 인덱스 저장 변수
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    // MARK: - Functions
    private func setTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ExpandableTableViewCell.self, forCellReuseIdentifier: ExpandableTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
    }
}

    // MARK: - UITableViewDataSource, UITableViewDelegate
extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableTableViewCell.identifier, for: indexPath) as? ExpandableTableViewCell else { return UITableViewCell() }
        cell.descriptionLabel.text = textData[indexPath.row]
        cell.selectionStyle = .none
        
        if expandedCell.contains(indexPath.row) {
            cell.descriptionLabel.numberOfLines = 0
            cell.seeMoreButton.isHidden = true
        } else {
            cell.descriptionLabel.numberOfLines = 5
            cell.seeMoreButton.isHidden = false
        }
        
        cell.seeMoreButtonClicked = { [weak self] in
            guard let self = self else { return }
            if self.expandedCell.contains(indexPath.row) {
                self.expandedCell.remove(indexPath.row)
            } else {
                self.expandedCell.insert(indexPath.row)
            }
            tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.expandedCell.contains(indexPath.row) {
            self.expandedCell.remove(indexPath.row)
        } else {
            self.expandedCell.insert(indexPath.row)
        }
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
}
