//
//  NoteCardView.swift
//  Notes
//
//  Created by Andrey on 13.04.2022.
//

import Foundation
import UIKit

final class NoteCardView: UIView {
    private let cardView = UIView().prepareForAutoLayout()
    private let titleView = UILabel().prepareForAutoLayout()
    private let subtitleView = UILabel().prepareForAutoLayout()
    private let dateView = UILabel().prepareForAutoLayout()
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }()

    var callback: ((NoteModel) -> Void)?

    var model: NoteModel? {
        didSet {
            guard let model = model else { return }
            titleView.text = model.title
            subtitleView.text = model.text
            dateView.text = formatter.string(from: model.date)
        }
    }
    init() {
        super.init(frame: .zero)
        commonInit()
        setupStyles()
        addRecognaizer()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impalemented")
    }

    private func commonInit() {
        addSubview(cardView)
        cardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        cardView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 14

        let stackView = UIStackView().prepareForAutoLayout()
        cardView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10).isActive = true
        stackView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        stackView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(subtitleView)

        cardView.addSubview(dateView)
        dateView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        dateView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        dateView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10 ).isActive = true

        stackView.bottomAnchor.constraint(equalTo: dateView.topAnchor, constant: -24).isActive = true
    }

    private func setupStyles() {
        titleView.font = UIFont(name: "SFProText-Medium", size: 16)
        subtitleView.font = UIFont(name: "SFProText-Medium", size: 10)
        subtitleView.textColor = .systemGray2
        dateView.font = UIFont(name: "SFProText-Medium", size: 10)
    }

    private func addRecognaizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        cardView.addGestureRecognizer(tapGesture)
    }

    @objc
    private func cardTapped() {
        guard let model = model else { return }
        callback?(model)
    }
}
