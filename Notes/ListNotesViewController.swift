//
//  ListNoteViewController.swift
//  Notes
//
//  Created by Andrey on 13.04.2022.
//

import Foundation
import UIKit

final class ListNotesViewController: UIViewController {
    private let scrollView = UIScrollView().prepareForAutoLayout()
    private let stackView = UIStackView().prepareForAutoLayout()
    private let addNoteButton = UIButton(type: .custom).prepareForAutoLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        setupUI()
        setupAddBotton()
    }
    private func setupAddBotton() {
        let image = UIImage(named: "button")
        addNoteButton.setImage(image, for: .normal)
        addNoteButton.addTarget(self, action: #selector(tapAddNoteButton), for: .touchUpInside)
    }
    private func setupUI() {
        navigationItem.title = "Заметки"

        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        scrollView.alwaysBounceVertical = true

        scrollView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackView.axis = .vertical

        view.addSubview(addNoteButton)
        addNoteButton.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -20
        ).isActive = true
        addNoteButton.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: -60
        ).isActive = true
        addNoteButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addNoteButton.heightAnchor.constraint(equalTo: addNoteButton.widthAnchor).isActive = true

        let model = NoteModel(
            title: "Заметка",
            date: Date(),
            text: "Текст Заметки"
        )
        for _ in 1...7 {
            let card = NoteCardView()
            card.model = model
            card.callback = { [weak self] model in
                let noteViewController = NoteViewController()
                noteViewController.configureElements(with: model)
                self?.navigationController?.pushViewController(noteViewController, animated: true)
            }
            stackView.addArrangedSubview(card)
        }
    }
    @objc func tapAddNoteButton(_ sender: Any) {
        let model = NoteModel(title: "", date: Date(), text: "")
        let noteViewController = NoteViewController()
        noteViewController.configureElements(with: model)
        navigationController?.pushViewController(noteViewController, animated: true)
    }
}
