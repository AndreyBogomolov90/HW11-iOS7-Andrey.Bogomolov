//
//  ViewController.swift
//  HW11-iOS7-Bogomolov.Andrey
//
//  Created by Andrey Bogomolov on 17.08.2022.
//

import UIKit
import SnapKit

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 15, y: 5, width: 20, height: 20))
        iconView.tintColor = .systemGray
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height:30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func setRightIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: -15, y: 5, width: 29, height: 20))
        iconView.tintColor = .systemGreen
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height:30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "myView")
        let imageView = UIImageView(image: image)
        return imageView
    }()

    private lazy var labelLogin: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        let icon = UIImage(systemName: "person.fill.checkmark") ?? UIImage()
        textField.textColor = .systemGray
        textField.backgroundColor = .white
        textField.placeholder = "Login"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.setLeftIcon(UIImage(systemName: "person") ?? UIImage())
        textField.setRightIcon(icon)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()

        textField.textColor = .systemGray
        textField.backgroundColor = .white
        textField.placeholder = "Password"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.setLeftIcon(UIImage(systemName: "lock") ?? UIImage())
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        return button
    }()
    
    private lazy var forgotLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        return button
    }()
    
    private lazy var labelConnectWith: UILabel = {
        let label = UILabel()
        label.text = "or connect with"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var leftLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var rightLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var facebookLoginButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "fb")
        let imageView = UIImageView(image: image)
        button.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(button.snp.centerY)
            make.left.equalTo(button.snp.left).offset(12)
            make.height.width.equalTo(25)
        }
        button.backgroundColor = .systemBlue
        button.setTitle("Facebook", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        return button
    }()
    
    private lazy var twitterLoginButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "tw")
        let imageView = UIImageView(image: image)
        button.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(button.snp.centerY)
            make.left.equalTo(button.snp.left).offset(23)
            make.height.width.equalTo(23)
        }
        button.backgroundColor = .systemPurple
        button.setTitle("Twitter", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        return button
    }()
    
    private lazy var labelHaveNotAccount: UILabel = {
        let label = UILabel()
        label.text = "Don't have account?"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.systemPurple, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(labelLogin)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(forgotLoginButton)
        view.addSubview(labelConnectWith)
        view.addSubview(leftLine)
        view.addSubview(rightLine)
        view.addSubview(facebookLoginButton)
        view.addSubview(twitterLoginButton)
        view.addSubview(labelHaveNotAccount)
        view.addSubview(signUpButton)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-300)
        }
        labelLogin.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(100)
        }
        loginTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(view).inset(50)
            make.height.equalTo(30)
            make.top.equalTo(labelLogin.snp.bottom).offset(30)
        }
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(view).inset(50)
            make.height.equalTo(30)
            make.top.equalTo(loginTextField.snp.bottom).offset(20)
        }
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(view).inset(50)
            make.height.equalTo(35)
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
        }
        forgotLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(view).inset(100)
            make.height.equalTo(15)
            make.top.equalTo(loginButton.snp.bottom).offset(15)
        }
        labelConnectWith.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(imageView.snp.bottom).offset(100)
        }
        leftLine.snp.makeConstraints { make in
            make.centerY.equalTo(labelConnectWith)
            make.right.equalTo(labelConnectWith.snp.left).inset(8)
            make.left.equalTo(view).inset(12)
            make.height.equalTo(1)
        }
        rightLine.snp.makeConstraints { make in
            make.centerY.equalTo(labelConnectWith)
            make.left.equalTo(labelConnectWith.snp.right).inset(8)
            make.right.equalTo(view).inset(12)
            make.height.equalTo(1)
        }
        facebookLoginButton.snp.makeConstraints { make in
            make.left.equalTo(view).inset(20)
            make.right.equalTo(view.snp.centerX).offset(-10)
            make.height.equalTo(30)
            make.top.equalTo(labelConnectWith.snp.bottom).offset(30)
        }
        twitterLoginButton.snp.makeConstraints { make in
            make.right.equalTo(view).inset(20)
            make.left.equalTo(view.snp.centerX).inset(-10)
            make.height.equalTo(30)
            make.top.equalTo(labelConnectWith.snp.bottom).offset(30)
        }
        labelHaveNotAccount.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX).offset(-40)
            make.top.equalTo(facebookLoginButton.snp.bottom).offset(30)
        }
        signUpButton.snp.makeConstraints { make in
            make.centerY.equalTo(labelHaveNotAccount)
            make.left.equalTo(labelHaveNotAccount.snp.right).offset(10)
        }
    }
        
    // MARK: - Actions
        
}

