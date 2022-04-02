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
        setupTitleView()
        setupMainTextView()
        mainTextView.becomeFirstResponder()
    }
    private func setupRightBarButton() {
        rightBarButton.title = "Готово"
        rightBarButton.target = self
        navigationItem.rightBarButtonItem = rightBarButton
    }
    private func setupTitleView() {
        view.addSubview(titleVeiw)
        titleVeiw.translatesAutoresizingMaskIntoConstraints = false
        titleVeiw.text = "Заметка"
        titleVeiw.font = .boldSystemFont(ofSize: 22)

            }

    private func setupMainTextView() {
        view.addSubview(mainTextView)
        mainTextView.translatesAutoresizingMaskIntoConstraints = false
        mainTextView.isUserInteractionEnabled = true
        mainTextView.text = "Текст Заметки"
        mainTextView.font = .systemFont(ofSize: 14)
    }
}
