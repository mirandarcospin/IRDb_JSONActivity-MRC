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
        
        configureView()
        
    }
    
    func configureView() {
        if let entry = detailItem {
            //For title
            if let label = titleLabel{
                label.text = entry.name
            }
            //For year
            if let label = yearLabel {
                if let ended = entry.yearEnd {
                    label.text = "\(entry.yearStart) - \(ended)"
                } else {
                    label.text = entry.yearStart
                }
            }
            //For format
            if let label = formatLabel {
                label.text = entry.format
            }
            //For episodes
            if let label = episodeLabel {
                if let countEpisodes = entry.episodes {
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
            if let textView = descriptionTextView {
                textView.text = entry.summary
            }
            //For description
            if let label = summaryLabel {
                label.text = entry.description
            }
            //For studio
            if let label = studioLabel {
                label.text = entry.studio
            }
            //For image
            if let imageView = mediaImage {
                let url = URL(string: entry.imageURL)
                let data = try? Data(contentsOf: url!)
                imageView.image = UIImage(data: data!)
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        if segue.identifier == "showCast" {
            let controller = segue.destination as! CastTableViewController
            if let castArrayList = detailItem?.starring {
                controller.castListArray = castArrayList
            }
        }
    }


}

