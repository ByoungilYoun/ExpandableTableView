//
//  ExpandableTableViewCell.swift
//  ExpandableTableView
//
//  Created by 윤병일 on 2023/03/23.
//

import UIKit
import SnapKit

final class ExpandableTableViewCell : UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "ExpandableTableViewCell"
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var seeMoreButton : UIButton = {
        let button = UIButton()
        button.setTitle("더 보기", for: .normal)
        button.titleLabel?.textAlignment = .right
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(seeMoreButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var seeMoreButtonClicked : (() -> Void)?
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func setUI() {
        backgroundColor = .systemBackground
        
        let stackView = UIStackView(arrangedSubviews: [descriptionLabel])
        
        [stackView, seeMoreButton].forEach {
            contentView.addSubview($0)
        }
        
        stackView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(10)
            $0.trailing.equalTo(seeMoreButton.snp.leading)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        seeMoreButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.equalTo(60)
            $0.height.equalTo(16)
        }
    }
    
    @objc func seeMoreButtonTapped() {
        seeMoreButtonClicked?()
    }
}
