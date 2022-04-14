//
//  ViewController.swift
//  Notes
//
//  Created by Andrey on 01.04.2022.
//

import UIKit

final class NoteViewController: UIViewController {
    struct KeysDefalts {
        static let keyMainTextView = "mainTextViewText"
        static let keyTitleView = "titleViewText"
    }
    let defaults = UserDefaults.standard
    let formatter = DateFormatter()
    private var rightBarButton = UIBarButtonItem()
    private var titleVeiw = UITextField().prepareForAutoLayout()
    private var mainTextView = UITextView().prepareForAutoLayout()
    private var dateFild = UILabel().prepareForAutoLayout()
    var model: NoteModel? {
        didSet {
            print(model as Any)
        }
    }

        override func viewDidLoad() {
        super.viewDidLoad()
            view.backgroundColor = .white
        setupRightBarButton()
        setupFildDate()
        setupTitleView()
        setupMainTextView()
        setupConstrains()
        mainTextView.becomeFirstResponder()
    }

    func configureElements(with model: NoteModel) {
        titleVeiw.text = model.title
        dateFild.text = model.date
        mainTextView.text = model.text
    }

    @objc
    private func saveNotes() {
        model = NoteModel(
            title: titleVeiw.text,
            text: mainTextView.text
        )
    }

    private func setupRightBarButton() {
        rightBarButton.title = "Готово"
        rightBarButton.style = .done
        rightBarButton.target = self
        rightBarButton.action = #selector(buttonTap)
        navigationItem.rightBarButtonItem = rightBarButton
    }

    private func showAlert() {
        let alertController = UIAlertController(title: "Ошибка", message: "Введите Заголовок", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    @objc func buttonTap(_ sender: Any) {
        let titleViewText = titleVeiw.text!
        titleVeiw.resignFirstResponder()
        mainTextView.resignFirstResponder()
        guard let mainTextViewText = mainTextView.text else {
            print("mainTextViewText - nil")
            return
        }
        if !titleViewText.isEmpty && !mainTextViewText.isEmpty {
            saveNotes()
        } else {
            showAlert()
        }
    }
    private func setupFildDate() {
        let time = NSDate()
        view.addSubview(dateFild)
        dateFild.textColor = UIColor(red: 0.675, green: 0.675, blue: 0.675, alpha: 1)
        formatter.dateFormat = "dd.mm.yyyy eeee HH:mm "
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFild.textAlignment = .center
        let formatteddate = formatter.string(from: time as Date)
        dateFild.text = "\(formatteddate)"
    }

    private func setupTitleView() {
        view.addSubview(titleVeiw)
        titleVeiw.placeholder = "Введите Заголовок"
        titleVeiw.borderStyle = .none
        titleVeiw.font = UIFont(name: "SFProText-Medium", size: 24)
    }

    private func setupMainTextView() {
        view.addSubview(mainTextView)
        mainTextView.font = UIFont(name: "SFProText-Regular", size: 16)
    }

    private func setupConstrains() {
        dateFild.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        dateFild.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        dateFild.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true

        titleVeiw.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        titleVeiw.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true

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

        titleVeiw.bottomAnchor.constraint(equalTo: mainTextView.topAnchor, constant: -16).isActive = true
        dateFild.bottomAnchor.constraint(equalTo: titleVeiw.topAnchor, constant: -12).isActive = true
    }
}
