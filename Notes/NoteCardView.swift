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

    var callback: ((NoteModel) -> Void)?

    var model: NoteModel? {
        didSet {
            guard let model = model else { return }
            titleView.text = model.title
            subtitleView.text = model.text
            dateView.text = model.date
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

        let stacView = UIStackView().prepareForAutoLayout()
        cardView.addSubview(stacView)
        stacView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10).isActive = true
        stacView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        stacView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        stacView.axis = .vertical
        stacView.spacing = 4
        stacView.addArrangedSubview(titleView)
        stacView.addArrangedSubview(subtitleView)

        cardView.addSubview(dateView)
        dateView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        dateView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        dateView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10 ).isActive = true

        stacView.bottomAnchor.constraint(equalTo: dateView.topAnchor, constant: -24).isActive = true
    }

    private func setupStyles() {
        titleView.font = .systemFont(ofSize: 16, weight: .medium)
        subtitleView.font = .systemFont(ofSize: 10, weight: .medium)
        subtitleView.textColor = .systemGray2
        dateView.font = .systemFont(ofSize: 10, weight: .medium)
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
