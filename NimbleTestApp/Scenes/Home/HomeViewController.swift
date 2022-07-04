//
//  HomeViewController.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//

import UIKit

protocol HomeViewControllerDelegate {
    func didSwipe()
}

class HomeViewController: BaseViewController {

    @IBOutlet weak var surveyCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonView: UIView!
    
    var delegate:HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        pageControl.numberOfPages = 5
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        setupCollectionView()
        buttonView.layer.cornerRadius = buttonView.frame.size.height/2
    }
    
    func setupData(){
        
    }
    
    private func setupCollectionView(){
        
        surveyCollectionView.register(UINib.init(nibName: "SurveyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "surveyCell")
        surveyCollectionView.delegate = self
        surveyCollectionView.dataSource = self
        surveyCollectionView.isPagingEnabled = true
        surveyCollectionView.showsHorizontalScrollIndicator = false
        surveyCollectionView.backgroundColor = .clear
       
    }
    
    @IBAction func didTapDetailsButton(_ sender: Any) {
        
        let vc = SurveyDetailViewController.instantiate(fromStoryboard: .Main)
        self.present(vc, animated: true)
    }
    

}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = surveyCollectionView.dequeueReusableCell(withReuseIdentifier: "surveyCell", for: indexPath) as! SurveyCollectionViewCell
        cell.clipsToBounds = true
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let height = surveyCollectionView.frame.size.height
            let width  =  UIScreen.main.bounds.size.width
        
            return CGSize(width: width, height: height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}

