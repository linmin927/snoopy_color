//
//  ViewController.swift
//  snoopy_color
//
//  Created by 林銘 on 2019/8/14.
//  Copyright © 2019 林家銘. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var snoopy: UIImageView!
    
    @IBOutlet weak var sky: UIImageView!
    
    @IBOutlet weak var redcolor: UISlider!
    
    @IBOutlet weak var greencolor: UISlider!
    
    @IBOutlet weak var bluecolor: UISlider!
    
    @IBOutlet weak var alpha: UISlider!
    
    @IBOutlet weak var redlabel: UILabel!
    
    @IBOutlet weak var greenlabel: UILabel!
    
    @IBOutlet weak var bluelanel: UILabel!
    
    @IBOutlet weak var alphalabel: UILabel!
    
    @IBOutlet weak var RedSwitch: UISwitch!
    @IBOutlet weak var GreenSwitch: UISwitch!
    
    @IBOutlet weak var BlueSwitch: UISwitch!
    
    
    @IBOutlet weak var RandomColor: UIButton!
    
    @IBOutlet weak var graydientview: UIImageView!
    
    @IBOutlet weak var graySwitch: UISwitch!
    
    //上面是變數--outlet
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //下面是功能--action
    
    //Slider滑動調整顏色&Label顯示目前數值
    @IBAction func coloradjust(_ sender: Any) {
        snoopy.backgroundColor = UIColor(red: CGFloat(redcolor.value), green: CGFloat(greencolor.value), blue: CGFloat(bluecolor.value), alpha: CGFloat(alpha.value))
        
        //label顯示slider的值，"％.2f"為小數點後兩位
        redlabel.text=String(format: "%.2f",redcolor.value)
        greenlabel.text=String(format:"%.2f",greencolor.value)
        bluelanel.text=String(format:"%.2f",bluecolor.value)
        alphalabel.text=String(format:"%.2f",alpha.value)
        
    }
    
 
    //Switch開關控制
    @IBAction func SwitchColor(_ sender: UISwitch) {
        
        //如果紅綠藍其中一個Switch打開，則亂數按鈕不能按
        if RedSwitch.isOn || GreenSwitch.isOn || BlueSwitch.isOn{
            
            RandomColor.isEnabled=false
            
            //如果Switch打開，則Slider不能滑動
            if RedSwitch.isOn{
                redcolor.isEnabled=false
            }else{
                redcolor.isEnabled=true
            }
            
            if GreenSwitch.isOn{
                greencolor.isEnabled=false
            }else{
                greencolor.isEnabled=true
            }
            
            if BlueSwitch.isOn{
                bluecolor.isEnabled=false
            }else{
                bluecolor.isEnabled=true
            }
        }else{
            RandomColor.isEnabled=true
        }
    }
    
    //RandomColor 亂數產生顏色
    @IBAction func Random(_ sender: UIButton) {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        let alpha = 1
        
        snoopy.backgroundColor=UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
        
        redlabel.text=String(format: "%.2f",red)
        greenlabel.text=String(format: "%.2f",green)
        bluelanel.text=String(format: "%.2f",blue)
        alphalabel.text=String(alpha)
        redcolor.value = Float(red)
        greencolor.value = Float(green)
        bluecolor.value = Float(blue)
        
    }
    //漸層開關
    @IBAction func graydientSwitch(_ sender: UISwitch) {
        
        let Layer = CAGradientLayer()
        
        if graySwitch.isOn{
            
            redcolor.isEnabled=false
            greencolor.isEnabled=false
            bluecolor.isEnabled=false
            alpha.isEnabled=false
            RandomColor.isEnabled=false
            
                snoopy.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            
                sky.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            
           
            Layer.frame = graydientview.bounds
            Layer.colors = [UIColor.orange.cgColor, UIColor.blue.cgColor]
            Layer.startPoint = CGPoint(x: 0, y: 0)
            Layer.endPoint = CGPoint(x: 1, y: 1)
            graydientview.layer.addSublayer(Layer)
            
        }
        else{
            
            redcolor.isEnabled=true
            greencolor.isEnabled=true
            bluecolor.isEnabled=true
            alpha.isEnabled=true
            RandomColor.isEnabled=true
            
            snoopy.backgroundColor = UIColor(red: CGFloat(redcolor.value), green: CGFloat(greencolor.value), blue: CGFloat(bluecolor.value), alpha: CGFloat(alpha.value))
            
            //label顯示slider的值，"％.2f"為小數點後兩位
            redlabel.text=String(format: "%.2f",redcolor.value)
            greenlabel.text=String(format:"%.2f",greencolor.value)
            bluelanel.text=String(format:"%.2f",bluecolor.value)
            alphalabel.text=String(format:"%.2f",alpha.value)
            
            Layer.frame = graydientview.bounds
            Layer.colors = [UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0).cgColor,UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0).cgColor]
            graydientview.layer.addSublayer(Layer)
        }
        
        
    }
    

}
