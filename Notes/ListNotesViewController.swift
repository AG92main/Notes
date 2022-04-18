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
    private let addNoteButton = UIButton().prepareForAutoLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        setupUI()
        setupAddBotton()
    }
    private func setupAddBotton() {
        let imageBottom = UIImage(named: "button")
        addNoteButton.setImage(imageBottom, for: UIControl.State.normal)
       // addNoteButton.layer.cornerRadius = 25
       // addNoteButton.clipsToBounds = true
       // addNoteButton.contentVerticalAlignment = .bottom
       // addNoteButton.setTitle("+", for: .normal)
       // addNoteButton.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .regular)
       // addNoteButton.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
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
        addNoteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 734).isActive = true
        addNoteButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 321).isActive = true
        addNoteButton.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -19
        ).isActive = true
        addNoteButton.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: -60
        ).isActive = true

        let model = NoteModel(
            title: "Заметка",
            date: Date().description,
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
        print("Button tapped")
    }
}
