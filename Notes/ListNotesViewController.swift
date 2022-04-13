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


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray

        setupUI()

    }
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)

        scrollView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor).isActive = true





    }
}
