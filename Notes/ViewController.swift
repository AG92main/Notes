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
        view.backgroundColor = .systemBackground
        setupRightBarButton()
        setupTitleView()
        setupMainTextView()
        mainTextView.becomeFirstResponder()
    }
    private func setupRightBarButton() {
        rightBarButton.title = "Готово"
        rightBarButton.target = self
        navigationItem.rightBarButtonItem = rightBarButton
        view.endEditing(true)
    }
    private func setupTitleView() {
        view.addSubview(titleVeiw)
        titleVeiw.translatesAutoresizingMaskIntoConstraints = false
        titleVeiw.text = ""
        titleVeiw.placeholder = "Заголовок"
        titleVeiw.borderStyle = .none
        titleVeiw.font = .boldSystemFont(ofSize: 22)
        titleVeiw.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleVeiw.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        titleVeiw.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
    }

    private func setupMainTextView() {
        view.addSubview(mainTextView)
        mainTextView.translatesAutoresizingMaskIntoConstraints = false
        mainTextView.text = ""
        mainTextView.font = .systemFont(ofSize: 14)
        mainTextView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20
        ).isActive = true
        mainTextView.leftAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leftAnchor,
            constant: 20
        ).isActive = true
        mainTextView.rightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.rightAnchor,
            constant: -20
        ).isActive = true
        titleVeiw.bottomAnchor.constraint(
            equalTo: mainTextView.topAnchor,
            constant: -15
        ).isActive = true
    }
}
