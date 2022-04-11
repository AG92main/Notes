//
//  ViewController.swift
//  Notes
//
//  Created by Andrey on 01.04.2022.
//

import UIKit

struct KeysDefalts {
    static let keyMainTextView = "mainTextViewText"
    static let keyTitleView = "titleViewText"
}

let model = NoteModel(
    title: "Заголовок",
    text: "Текст Заметки"
)

let screen = ViewController()

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    let formatter = DateFormatter()
    private var rightBarButton = UIBarButtonItem()
    private var titleVeiw = UITextField()
    private var mainTextView = UITextView()
    private var dateFild = UITextField()
    private var datePicker = UIDatePicker()
    var model: NoteModel? {
        didSet {
            print(model as Any)
        }
    }

        override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupRightBarButton()
        setupTitleView()
        setupMainTextView()
        saveNotes()
        setupDataPicker()
        setupFildDate()
        mainTextView.becomeFirstResponder()
    }

    func configureElements(with model: NoteModel) {
        titleVeiw.text = model.title
        dateFild.text = model.subtitle
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
            // defaults.set(titleViewText, forKey: KeysDefalts.keyTitleView)
            // defaults.set(mainTextViewText, forKey: KeysDefalts.keyMainTextView)
        } else {
            showAlert()
        }
    }

    private func setupTitleView() {
        view.addSubview(titleVeiw)
        titleVeiw.translatesAutoresizingMaskIntoConstraints = false
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
    }

    private func setupDataPicker() {
        view.addSubview(dateFild)
        dateFild.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        dateFild.translatesAutoresizingMaskIntoConstraints = false
        dateFild.bottomAnchor.constraint(equalTo: mainTextView.topAnchor, constant: -15).isActive = true
        titleVeiw.bottomAnchor.constraint(equalTo: dateFild.topAnchor, constant: -15).isActive = true
        dateFild.leftAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leftAnchor,
            constant: 20
        ).isActive = true
        dateFild.rightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.rightAnchor,
            constant: -20
        ).isActive = true
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButtom = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems(
            [flexSpace, doneButtom],
            animated: true
        )
        dateFild.inputAccessoryView = toolbar
    }

    @objc func doneAction() {
        setupGetDatePicker()
        view.endEditing(true)
    }

    private func setupGetDatePicker() {
        dateFild.text = formatter.string(from: datePicker.date)
    }

    private func setupFildDate() {
        let time = NSDate()
        formatter.dateFormat = "dd MMMM yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let formatteddate = formatter.string(from: time as Date)
        dateFild.placeholder = "\(formatteddate)"
    }
}
