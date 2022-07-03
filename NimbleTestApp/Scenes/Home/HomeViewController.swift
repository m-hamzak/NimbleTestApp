//
//  HomeViewController.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var surveyCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
       
    func setupView(){
        registerCells()
    }
    
    func setupData(){
        
    }
    
    private func registerCells(){
        surveyCollectionView.register(UINib.init(nibName: "SurveyView", bundle: nil), forCellWithReuseIdentifier: "surveyCell")
       
    }

}
