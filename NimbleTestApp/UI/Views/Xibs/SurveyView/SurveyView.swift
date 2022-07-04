//
//  SurveyView.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 02/07/2022.
//

import UIKit


class SurveyView: UIView {
    
    @IBOutlet weak var bgImageview: UIImageView!
    @IBOutlet weak var surveyHeadLabel: UILabel!
    @IBOutlet weak var surveyDescriptionLabel: UILabel!
    @IBOutlet weak var surveyPageControl: UIPageControl!
    
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK:- SETUP NIB
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        loadNib()
    }
    
    internal func loadNib() {
        let view = getNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    internal func getNib() -> UIView {
        let bundle = Bundle(for: SurveyView.self)
        let nib = UINib(nibName: "SurveyView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return UIView()
        }
        return view
    }
    
}
