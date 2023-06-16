//
//  SplashViewController.swift
//  SpeedTest
//
//  Created by Nguyen Trung on 6/15/23.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    
    var progressTimer: Timer?
    var currentProgress: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        progressView.progress = 0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @objc func updateProgress() {
        currentProgress += 1.0
        
        progressView.setProgress((currentProgress/100.0), animated: true)
        
        if currentProgress >= 100.0 {
            progressTimer?.invalidate()
            progressTimer = nil
            perform(#selector(transitionToMainScreen), with: nil, afterDelay: 0.5)
        }
    }
    
    @objc func transitionToMainScreen() {
        navigationController?.pushViewController(MainViewController(), animated: true)
//        NSLog("navigationController is nil: %d", navigationController == nil)
//        let mainViewController = MainViewController()
//        present(mainViewController, animated: true, completion: nil)

    }
    
    deinit {
        progressTimer?.invalidate()
        progressTimer = nil
    }
}
