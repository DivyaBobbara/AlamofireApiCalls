//
//  ViewController.swift
//  ProjectAlamofireApiCalls
//
//  Created by Naga Divya Bobbara on 16/08/22.
//

import UIKit
import DropDown
import Alamofire


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var dobTextField: UITextField!
    
    private var datePicker : UIDatePicker?
    
    @IBOutlet weak var viewDropDown: UIView!
    
    @IBOutlet weak var lblDropDown: UILabel!
    let dropDown = DropDown()
    let array = ["male","female"]
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode  = .date
        datePicker?.maximumDate = Date()
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        dobTextField.inputView = datePicker
        
        //DropDown
        viewDropDown.layer.cornerRadius = 8
        dropDown.anchorView = viewDropDown
        dropDown.dataSource = array
        
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lblDropDown.text = array[index]
            
           
            
        }
//        let params : Parameters = [
//            "userName" : "Rajesh",
//            "dateOfBirth" : "2001/06/25",
//            "gender" : "male",
//            "mail" : "rajesh@gmail.com",
//            "userPassword" : "rajesh@123"
//        ]
//        AF.request("http://stagetao.gcf.education:3000/api/v1/register", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseDecodable(of: RegisterUserModel.self) { res in
//            print(res.value)
//        }
//
        
        
        
    }
    @objc func dateChanged(datePicker : UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dobTextField.text = dateFormatter.string(from: datePicker.date)
        
        
    }
    @IBAction func showDropDown(_ sender : UIButton)
    {
        dropDown.show()
    }
    

    @IBAction func dropDownIconAction(_ sender: Any) {
        dropDown.show()
    }
    
    
    
    @IBAction func RegisterButtonAction(_ sender: Any) {
        ViewModel.shared.registerUserApi(userName: userNameTextField.text ?? "", dob: dobTextField.text ?? "", gender: lblDropDown.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "") { response in
            print(response?.message)
            self.displayAlert(message: response?.message ?? "")
        }
    }
    func displayAlert(message:String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
}

