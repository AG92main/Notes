//
//  ViewController.swift
//  Notes
//
//  Created by Andrey on 01.04.2022.
//

import UIKit

class ViewController: UIViewController {
    private var rightBarButton = UIBarButtonItem()
    private var placehlderTextView = UITextField()
    private var titleView = UILabel()
    private var mainTextView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupRightBarButton()
        setupplacehlderTextView()
        setupTitleTextView()
        setupMainTextView()
        mainTextView.becomeFirstResponder()
    }
    private func setupRightBarButton() {
        rightBarButton.title = "Готово"
        rightBarButton.target = self
        navigationItem.rightBarButtonItem = rightBarButton
    }
    private func setupplacehlderTextView() {
        view.addSubview(placehlderTextView)
        placehlderTextView.text = ""
    }
    private func setupTitleTextView() {
        view.addSubview(titleView)
        titleView.text = "Заметка"
        titleView.font = .boldSystemFont(ofSize: 22)
    }
    private func setupMainTextView() {
        view.addSubview(mainTextView)
        mainTextView.text = "Текст Заметки"
        mainTextView.font = .systemFont(ofSize: 14)
    }
}
