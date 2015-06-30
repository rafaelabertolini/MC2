//
//  ProblemaViewController.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 26/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit

class ProblemaViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var oQueView: UIView!
    
    @IBOutlet weak var quantoView: UIView!
    
    @IBOutlet weak var quandoView: UIView!
    
    @IBOutlet weak var medidaPickerView: UIPickerView!
    
    @IBOutlet weak var frequenciaPickerView: UIPickerView!
    
    @IBOutlet weak var tempoPickerView: UIPickerView!
    
    @IBOutlet weak var iniciarButton: UIButton!
    
    var pickerData = ["Comprimidos", "Doses/Copos", "Cigarros", "Gramas", "Carreiras", "Pedras"]
    
    var morePickerData = ["1 vez", "2 vezes", "3 vezes", "4 vezes", "5 vezes", "6 vezes", "7 vezes", "8 vezes", "9 vezes", "10 vezes", "Mais de 10 vezes"]
    
    var dataPickerData = ["Dia", "Semana", "Mês"]
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 100){
            return pickerData.count
        } else if (pickerView.tag == 200){
            return morePickerData.count
        } else if (pickerView.tag == 300){
            return dataPickerData.count
        }
        
        return 0
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if(pickerView.tag == 100){
            return pickerData[row]
        } else if (pickerView.tag == 200){
            return morePickerData[row]
        } else if (pickerView.tag == 300){
            return dataPickerData[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oQueView.layer.cornerRadius = 25
        quantoView.layer.cornerRadius = 25
        quandoView.layer.cornerRadius = 25
        
        medidaPickerView.dataSource = self
        medidaPickerView.delegate = self
        
        frequenciaPickerView.dataSource = self
        frequenciaPickerView.delegate = self
        
        tempoPickerView.dataSource = self
        tempoPickerView.delegate = self
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
    }
}
