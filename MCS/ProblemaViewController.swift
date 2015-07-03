//
//  ProblemaViewController.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 26/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit
import CoreData

class ProblemaViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var oQueView: UIView!
    
    @IBOutlet weak var quantoView: UIView!
    
    @IBOutlet weak var quandoView: UIView!
    
    @IBOutlet weak var medidaPickerView: UIPickerView!
    
    @IBOutlet weak var frequenciaPickerView: UIPickerView!
    
    @IBOutlet weak var tempoPickerView: UIPickerView!
    
    @IBOutlet weak var iniciarButton: UIButton!
    
    @IBOutlet weak var oQueUsoTextField: UITextField!
    
    @IBOutlet weak var quantoUsoTextField: UITextField!
    
    
    var pickerData = ["Selecione", "Comprimidos", "Doses/Copos", "Cigarros", "Gramas", "Carreiras", "Pedras"]
    
    var morePickerData = ["Selecione", "1 vez", "2 vezes", "3 vezes", "4 vezes", "5 vezes", "6 vezes", "7 vezes", "8 vezes", "9 vezes", "10 vezes", "Mais de 10 vezes"]
    
    var dataPickerData = ["Selecione", "Dia", "Semana", "Mês"]
    
    var medidaQ = ""
    
    var medidaF = ""
    
    var vezes = ""
    
    @IBAction func pressionaSalvar(sender: UIButton) {
        self.salvarProblema()
    }
    
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
        if(pickerView.tag == 100){
            medidaQ = pickerData[row]
            print(medidaQ)
        } else if (pickerView.tag == 200){
            vezes = morePickerData[row]
            print(vezes)
        } else if (pickerView.tag == 300){
            medidaF = dataPickerData[row]
            print(medidaF)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        self.view.addGestureRecognizer(tap)
        
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
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = false
    }
    
    
    func DismissKeyboard(){
        
        view.endEditing(true)
        
    }
    
    
    func salvarProblema() {
        
        var mensagem = ""
        
        if(vezes != "" && medidaF != "" && medidaQ != "" && oQueUsoTextField.text != "" && quantoUsoTextField.text != ""){
            let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext!
            
            let entity = NSEntityDescription.entityForName("Problem", inManagedObjectContext: managedContext)
            let problem = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext) as! Problem
            
            problem.oque = oQueUsoTextField.text
            problem.frequencia = vezes
            problem.medidafreq = medidaF
            problem.medidaqtd = medidaQ
            
            if let myNumber = NSNumberFormatter().numberFromString(quantoUsoTextField.text) {
                var myInt = myNumber.integerValue
                problem.quanto = myInt
                var error: NSError?
                if !managedContext.save(&error) {
                    println("Could not save \(error), \(error?.userInfo)")
                    mensagem = "Erro ao salvar!"
                    
                } else {
                    
                    mensagem = "Salvo!"
                    print("Não deu erro ao salvar")
                    self.navigationController?.popViewControllerAnimated(true)
                }
                
            } else {
                
                mensagem = "Você deve digitar um número na quantidade!"
                
            }
            
            //problem.quanto = quantoUsoTextField.text.toInt()!

        } else {
            
            mensagem = "Selecione todos os campos."
            
        }
        
        var alert = UIAlertController(title: "", message: mensagem, preferredStyle: UIAlertControllerStyle.Alert)
        //alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                println("default")
                
            case .Cancel:
                println("cancel")
                
            case .Destructive:
                println("destructive")
            }
        }))

    }
    
}
