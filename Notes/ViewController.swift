//
//  ViewController.swift
//  Notes
//
//  Created by Andrey on 01.04.2022.
//

import UIKit

class ViewController: UIViewController {
    private var rightBarButton = UIBarButtonItem()
    private var titleVeiw = UITextField()
    private var mainTextView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupRightBarButton()
        setupMainTextView()
        mainTextView.becomeFirstResponder()
    }
    private func setupRightBarButton() {
        rightBarButton.title = "Готово"
        rightBarButton.target = self
        navigationItem.rightBarButtonItem = rightBarButton
    }
    private func titleView() {
        view.addSubview(titleVeiw)
        titleVeiw.translatesAutoresizingMaskIntoConstraints = false
        titleVeiw.text = "Заметка"
        titleVeiw.font = .boldSystemFont(ofSize: 22)
        titleVeiw.trailingAnchor.constraint(
            lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -20
        ).isActive = true
    }

    private func setupMainTextView() {
        view.addSubview(mainTextView)
        mainTextView.translatesAutoresizingMaskIntoConstraints = false
        mainTextView.text = "Текст Заметки"
        mainTextView.font = .systemFont(ofSize: 14)
        mainTextView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 20
        ).isActive = true
        mainTextView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -20
        ).isActive = true
        mainTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
