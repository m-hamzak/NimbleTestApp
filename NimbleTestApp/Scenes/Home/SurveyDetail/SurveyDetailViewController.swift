//
//  SurveyDetailViewController.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 03/07/2022.
//

import UIKit

class SurveyDetailViewController: UIViewController {
    
    
    @IBOutlet weak var surveyHeadingLabel: UILabel!
    @IBOutlet weak var surveyDescriptionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapBackButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didTapStartSurveyButton(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
