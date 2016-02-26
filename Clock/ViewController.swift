/*
Ryan Riley
Febuary/28/2016

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel! //Sets an outlet so we can control the item on the screen
    let clock = Clock() //Creates an instance of a clock
    var timer: NSTimer? //Creates an istance of a NSTimer
    
    override func viewDidLoad() { //Starts the timer when the view loads
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
            target: self,
            selector: "updateTimeLabel",
            userInfo: nil,
            repeats: true)
    }
    
    override func viewWillAppear(animated: Bool) { //When the app launches, this displays the correct time
        
        super.viewWillAppear(animated)
        let formatter = NSDateFormatter() //Used to format the time
        formatter.timeStyle = .MediumStyle
        timeLabel.text = formatter.stringFromDate(clock.currentTime)
    }

    override func didReceiveMemoryWarning() { //Stops if there is an error
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    func updateTimeLabel(){ //A function used to constantly update and display the time
        
        let formatter = NSDateFormatter() //Used to format the time
        formatter.timeStyle = .MediumStyle
        timeLabel.text = formatter.stringFromDate(clock.currentTime)
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask { //Used to allow the view to be upside down
        return UIInterfaceOrientationMask.All
    }
    
    deinit{ //Stops the timer when the program is not in the foreground to not slow down the processor
        if let timer = self.timer{
            timer.invalidate()
        }
    }
}


