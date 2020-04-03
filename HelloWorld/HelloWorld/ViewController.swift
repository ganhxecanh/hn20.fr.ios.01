//
//  ViewController.swift
//  HelloWorld
//
//  Created by Hung Vuong on 4/1/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let pickerData : [(key : String , value : String)] = [("Vietnamese" , "Chào thế giới"), ("Thailand" , "สวัสดี ชาว โลก"),("German" , "Hallo Welt"),("Turkish" , "Selam Dünya"),("Korea" , "안녕하세요 세계"),("Catalan" , "Hola dishes"),("Latin" , "Salve mundi"),("Itali" , "Ciao mondo"),("Czech" , "Ahoj světe"),("Irish" , "Dia duit ar domhan"),("Hungari" , "Helló Világ"),("Lao" , "ສະ ບາຍ ດີ ຊາວ ໂລກ"),("Spanish" , "Hola Mundo"),("Georgian" , "Გამარჯობა მსოფლიო"),("Urdu" , "ہیلو دنیا"),("Marathi" , "हॅलो वर्ल्ड"),("China" , "你好 世界"),("Ukraina" , "Привіт Світ")]
    var n: Int = 0
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    @IBAction func change(_ sender: UIButton) {
        textLabel.text = pickerData[n].value
    }
}
extension ViewController : UIPickerViewDelegate , UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].key
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        n = row
    }
}



