//
//  ViewController.swift
//  testLabelTabBarNav
//
//  Created by Леонид Шелудько on 28.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var textLabel = UILabel()
    var sliderFont = UISlider()
    var minusButton = UIButton()
    var plusButton = UIButton()
    var colorPicker = UIPickerView()
    var linesPicker = UIPickerView()
    var colorShadowPicker = UIPickerView()
    var shriftPicker = UIPickerView()
    var switchShadow = UISwitch()
    var switchWrap = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView()

        addPlus()
        
        text()
        
        slider()
        
        minus()
        
        plus()
        
        colorPick()
        
        allLabels()
        
        switchSh()
        
        switchWW()
    }
    
    //MARK: - Labels
    fileprivate func allLabels() {
        let sizeLabel = UILabel()
        sizeLabel.frame = CGRect(x: 170, y: 300, width: 40, height: 20)
        sizeLabel.text = "Размер"
        sizeLabel.textColor = .gray
        sizeLabel.sizeToFit()
        view.addSubview(sizeLabel)
        
        let colorLabel = UILabel()
        colorLabel.frame = CGRect(x: 95, y: 410, width: 100, height: 20)
        colorLabel.text = "Цвет"
        colorLabel.textColor = .gray
        view.addSubview(colorLabel)
        
        let linesLabel = UILabel()
        linesLabel.frame = CGRect(x: 92, y: 550, width: 100, height: 20)
        linesLabel.text = "Линии"
        linesLabel.textColor = .gray
        view.addSubview(linesLabel)
        
        let colorShadowLabel = UILabel()
        colorShadowLabel.frame = CGRect(x: 250, y: 550, width: 100, height: 20)
        colorShadowLabel.text = "Цвет тени"
        colorShadowLabel.textColor = .gray
        view.addSubview(colorShadowLabel)
        
        let schtiftLabel = UILabel()
        schtiftLabel.frame = CGRect(x: 260, y: 410, width: 100, height: 20)
        schtiftLabel.text = "Шрифт"
        schtiftLabel.textColor = .gray
        view.addSubview(schtiftLabel)
        
        let shadowLabel = UILabel()
        shadowLabel.frame = CGRect(x: 50, y: 680, width: 300, height: 25)
        shadowLabel.text = "Включить тень"
        shadowLabel.font = UIFont.boldSystemFont(ofSize: 22)
        shadowLabel.textColor = .black
        view.addSubview(shadowLabel)
        
        let wrapLabel = UILabel()
        wrapLabel.frame = CGRect(x: 50, y: 730, width: 300, height: 25)
        wrapLabel.text = "Переносить по словам"
        wrapLabel.font = UIFont.boldSystemFont(ofSize: 22)
        wrapLabel.textColor = .black
        view.addSubview(wrapLabel)
    }

    //MARK: - Таб Бар
    fileprivate func mainView() {
        self.view.backgroundColor = .white
        title = "Label"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        tabBarItem = UITabBarItem(title: "Label", image: UIImage(systemName: "pencil"), tag: 0)
        self.tabBarItem = tabBarItem
    }
    
    //MARK: - Добавить текст
    fileprivate func addPlus() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(addTextMethod(target:)))
    }
    
    @objc func addTextMethod(target: UIBarButtonItem) {
        let alert = UIAlertController(title: "Введитте текст", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default){ _ in
            let text = alert.textFields?.first
            self.textLabel.text! = (text?.text!)!
        }
        alert.addTextField()
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    fileprivate func text() {
        textLabel.frame = CGRect(x: 50, y: 100, width: 300, height: 200)
        textLabel.text = ""
        textLabel.textAlignment = .center
        self.view.addSubview(textLabel)
    }
    
    
    //MARK: -Slider Font Size
    fileprivate func slider() {
        sliderFont.frame = CGRect(x: 90, y: 330, width: 230, height: 23)
        sliderFont.minimumValue = 5
        sliderFont.maximumValue = 45
        sliderFont.value = 14
        view.addSubview(sliderFont)
        
        sliderFont.addTarget(self, action: #selector(changeSlider(sender: )), for: .valueChanged)
    }
    
    @objc func changeSlider(sender: UISlider) {
        textLabel.font = textLabel.font.withSize(CGFloat(sender.value))
    }
    
    fileprivate func minus() {
        minusButton.frame = CGRect(x: 55, y: 330, width: 25, height: 18)
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.blue, for: .normal)
        minusButton.titleLabel?.font = .systemFont(ofSize: 45)
        self.view.addSubview(minusButton)
        
        minusButton.addTarget(self, action: #selector(minusAction(target: )), for: .touchUpInside)
    }
    
    @objc func minusAction(target: UIButton) {
        sliderFont.value -= 3
        textLabel.font = textLabel.font.withSize(CGFloat(sliderFont.value))
    }
    
    fileprivate func plus() {
        plusButton.frame = CGRect(x: 330, y: 330, width: 25, height: 20)
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.blue, for: .normal)
        plusButton.titleLabel?.font = .systemFont(ofSize: 30)
        self.view.addSubview(plusButton)
        
        plusButton.addTarget(self, action: #selector(plusAction(target: )), for: .touchUpInside)
    }
    
    @objc func plusAction(target: UIButton) {
        sliderFont.value += 3
        textLabel.font = textLabel.font.withSize(CGFloat(sliderFont.value))
    }
    
    //MARK: - Switch
    fileprivate func switchSh() {
        switchShadow.frame = CGRect(x: 310, y: 678, width: 0, height: 0)
        switchShadow.addTarget(self, action: #selector(switchTarget(target: )), for: .valueChanged)
        view.addSubview(switchShadow)
    }
    
    @objc func switchTarget(target: UISwitch) {
        if target.isOn {
            textLabel.shadowOffset = CGSize(width: 2.5, height: 2.5)
        } else {
            textLabel.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    fileprivate func switchWW() {
        switchWrap.frame = CGRect(x: 310, y: 728, width: 0, height: 0)
        switchWrap.addTarget(self, action: #selector(switchWrapTarget(target: )), for: .valueChanged)
        view.addSubview(switchWrap)
    }
    
    @objc func switchWrapTarget(target: UISwitch) {
        if target.isOn {
            textLabel.lineBreakMode = .byWordWrapping
        } else {
            textLabel.lineBreakMode = .byTruncatingTail
        }
    }
    
    //MARK: - ПИКЕРЫ
    
    fileprivate func colorPick() {
        colorPicker.frame = CGRect(x: 30, y: 420, width: 170, height: 100)
        colorPicker.delegate = self
        colorPicker.dataSource = self
        view.addSubview(colorPicker)
        
        linesPicker.frame = CGRect(x: 30, y: 560, width: 170, height: 100)
        linesPicker.delegate = self
        linesPicker.dataSource = self
        view.addSubview(linesPicker)
        
        colorShadowPicker.frame = CGRect(x: 200, y: 560, width: 170, height: 100)
        colorShadowPicker.delegate = self
        colorShadowPicker.dataSource = self
        view.addSubview(colorShadowPicker)
        
        shriftPicker.frame = CGRect(x: 200, y: 420, width: 170, height: 100)
        shriftPicker.delegate = self
        shriftPicker.dataSource = self
        view.addSubview(shriftPicker)
    }
}

let colorArray = [("black", UIColor.black),
                  ("yellow", UIColor.yellow),
                  ("green", UIColor.green),
                  ("brown", UIColor.brown),
                  ("red", UIColor.red),
                  ("orange", UIColor.orange),
                  ("gray", UIColor.gray)]

let linesArray = [1, 2, 3, 0]

let schriftArray = ["Helvetica Neue", "Cochin", "Avenir Next"]

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case colorPicker:
            return colorArray.count
        case linesPicker:
            return linesArray.count
        case colorShadowPicker:
            return colorArray.count
        case shriftPicker:
            return schriftArray.count
        default:
            return 3
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case colorPicker:
            return colorArray[row].0
        case linesPicker:
            return String(linesArray[row])
        case colorShadowPicker:
            return colorArray[row].0
        case shriftPicker:
            return schriftArray[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case colorPicker:
            self.textLabel.textColor = colorArray[row].1
        case linesPicker:
            self.textLabel.numberOfLines = linesArray[row]
        case colorShadowPicker:
            self.textLabel.shadowColor = colorArray[row].1
        case shriftPicker:
            self.textLabel.font = UIFont(name: schriftArray[row], size: self.textLabel.font.pointSize)
        default:
            break
        }
    }
    
}
