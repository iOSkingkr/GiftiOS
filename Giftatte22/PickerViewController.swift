//
//  PickerViewController.swift
//  
//
//  Created by 이재희 on 2022/05/02.
//

import UIKit

class PickerViewController: UIViewController {
    var categoryNameList: [String] = ["입학/졸업", "생일", "결혼/출산", "취업/퇴사", "기념일"]
    var gender: String = ""
    var age: String = ""
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var selectedPickerUIView: UIView!

    
    private func pushNextPage(category: String){
        guard let goNextPage = self.storyboard?.instantiateViewController(identifier: "SurveyResultViewController") as? SurveyResultViewController else { return }
        goNextPage.age = age
        goNextPage.gender = gender
        goNextPage.category = category
        self.navigationController?.pushViewController(goNextPage, animated: true)
    }
        
    @IBAction func didTapNextButton(_ sender: Any) {
        pushNextPage(category: "1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        selectedPickerUIView.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
        selectedPickerViewUICustom()
    }

    func selectedPickerViewUICustom() {
        pickerView.subviews[1].backgroundColor = .clear

//        let upLine = UIView(frame: CGRect(x: 100, y: 0, width: 150, height: 0.8))
//        let underLine = UIView(frame: CGRect(x: 100, y: 60, width: 150, height: 0.8))
//
//        upLine.backgroundColor = UIColor.gray
//        underLine.backgroundColor = UIColor(rgb: 0x0061B4)
//
//        pickerView.subviews[1].addSubview(upLine)
//        pickerView.subviews[1].addSubview(underLine)
   }
    
}
extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
//        view.backgroundColor = .white

        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        nameLabel.text = categoryNameList[row]
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .light)

        view.addSubview(nameLabel)
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryNameList.count
    }
 
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select=\(row)")
    }
}


//extension UIColor {
//   convenience init(red: Int, green: Int, blue: Int) {
//       assert(red >= 0 && red <= 255, "Invalid red component")
//       assert(green >= 0 && green <= 255, "Invalid green component")
//       assert(blue >= 0 && blue <= 255, "Invalid blue component")
//
//       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//   }
//
//   convenience init(rgb: Int) {
//       self.init(
//           red: (rgb >> 16) & 0xFF,
//           green: (rgb >> 8) & 0xFF,
//           blue: rgb & 0xFF
//       )
//   }
//}
