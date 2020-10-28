//
//  ViewController.swift
//  IRDb_JSONActivity-MRC
//
//  Created by Miranda Ramirez Cospin on 10/20/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var formatLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    @IBOutlet var studioLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    var detailItem: Entry? {
        didSet {
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = detailItem?.name
        
        let nav = self.navigationController?.navigationBar

        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
        
    }
    
    func configureView() {
        if let detail = detailItem {
            //For description
            if let textView = descriptionTextView {
                textView.text = detail.description
            }
            //For title
            title = detail.name
            //For year
            if let label = yearLabel {
                if let ended = detail.yearEnd {
                    label.text = "\(detail.yearStart) - \(ended)"
                } else {
                    label.text = detail.yearStart
                }
            }
            //For format
            if let label = formatLabel {
                label.text = detail.format
            }
            //For episodes
            if let label = episodeLabel {
                if let countEpisodes = detail.episode {
                    if countEpisodes > 1 {
                        label.text = "\(countEpisodes) Episodes"
                    } else {
                        label.text = "\(countEpisodes) Episode"
                    }
                } else {
                    label.text = ""
                }
            }
            //For summary
            if let label = summaryLabel {
                label.text = detail.summary
            }
            //For studio or network
//            if let label = studioLabel {
//
//            }
            //For image
            if let imageView = mediaImage {
                let url = URL(string: detail.imageURL)
                let data = try? Data(contentsOf: url!)
                imageView.image = UIImage(data: data!)
            }
        }
    }


}

