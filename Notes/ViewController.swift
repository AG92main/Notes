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
    private var dateFild = UITextField()
    private var datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupRightBarButton()
        setupTitleView()
        setupMainTextView()
        setupDataPicker()
        setupGetDatePicker()
        mainTextView.becomeFirstResponder()
    }
    private func setupRightBarButton() {
        rightBarButton.title = "Готово"
        rightBarButton.target = self
        navigationItem.rightBarButtonItem = rightBarButton
        view.endEditing(true)
    }
    private func setupDataPicker() {
        dateFild.inputView = datePicker
        datePicker.datePickerMode = .date
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButtom = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems(
            [flexSpace, doneButtom],
            animated: true
        )
        dateFild.inputAccessoryView = toolbar
        dateFild.translatesAutoresizingMaskIntoConstraints = false
        dateFild.leftAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leftAnchor,
            constant: 20
        ).isActive = true
        dateFild.rightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.rightAnchor,
            constant: -20
        ).isActive = true
        dateFild.topAnchor.constraint(
            equalTo: titleVeiw.bottomAnchor,
            constant: 14
        ).isActive = true
    }
    @objc func doneAction() {
        setupGetDatePicker()
        view.endEditing(true)
    }
    private func setupGetDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MMMM.yyyy"
        dateFild.text = formatter.string(from: datePicker.date)
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
        dateFild.bottomAnchor.constraint(
            equalTo: mainTextView.topAnchor,
            constant: -15
        ).isActive = true
    }
}
