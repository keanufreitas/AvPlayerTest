//
//  ViewController.swift
//  AppleTVTest
//
//  Created by Keanu Freitas on 6/4/18.
//  Copyright © 2018 Keanu Freitas. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

var playerController = AVPlayerViewController()

class ViewController: UIViewController, AVPlayerViewControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var lblTitle:UILabel!
    @IBOutlet var descLbl:UILabel!
    @IBOutlet var cover:UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var passedSegments = [Segment]()
    var passedProfitSystem: ProfitSystem!
    
    let coverArts = [ #imageLiteral(resourceName: "4-marketing-system-191"), #imageLiteral(resourceName: "23-start-here"), #imageLiteral(resourceName: "26-direct-mail"), #imageLiteral(resourceName: "27-mls-deal-making-191"), #imageLiteral(resourceName: "29-seller-financing"), #imageLiteral(resourceName: "30-subject-to"), #imageLiteral(resourceName: "32-pocket-listing"), #imageLiteral(resourceName: "33-probate-investing"), #imageLiteral(resourceName: "34-neuro-linguistic-negotiation"), #imageLiteral(resourceName: "35-analytics"), #imageLiteral(resourceName: "37-401k-freedom"), #imageLiteral(resourceName: "38-credit-line"), #imageLiteral(resourceName: "39-estate-planning"), #imageLiteral(resourceName: "41-online-lead-generation"), #imageLiteral(resourceName: "42-mobile-home"), #imageLiteral(resourceName: "43-warrior-mindset"), #imageLiteral(resourceName: "33-probate-investing"), #imageLiteral(resourceName: "be-the-bank"), #imageLiteral(resourceName: "blitz-sales"), #imageLiteral(resourceName: "brandmarketing"), #imageLiteral(resourceName: "cheap-house"), #imageLiteral(resourceName: "compound-cashflow"), #imageLiteral(resourceName: "contract-system"), #imageLiteral(resourceName: "deal-or-no-deal"), #imageLiteral(resourceName: "fearless-flipping"), #imageLiteral(resourceName: "government-compliance"), #imageLiteral(resourceName: "income-streams"), #imageLiteral(resourceName: "irresistable-offer"), #imageLiteral(resourceName: "lead-capture"), #imageLiteral(resourceName: "on-demand-buyers"), #imageLiteral(resourceName: "outsourcing"), #imageLiteral(resourceName: "part-time-profit"), #imageLiteral(resourceName: "payday-profit"), #imageLiteral(resourceName: "private-money"), #imageLiteral(resourceName: "rehabbing"), #imageLiteral(resourceName: "rental-system"), #imageLiteral(resourceName: "repair-estimate"), #imageLiteral(resourceName: "seller-negotation"), #imageLiteral(resourceName: "tax-shrinker"), #imageLiteral(resourceName: "wholesaling") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        lblTitle.text = passedProfitSystem.title
        descLbl.text = passedProfitSystem.desc
        findCoverArt()
        passedSegments = passedProfitSystem.segments
    }
    
    func findCoverArt() {
        let coverArt = passedProfitSystem.cover
        for art in coverArts {
            
            if art == UIImage(named: coverArt) {
                DispatchQueue.main.async {
                    self.cover.image = art
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let playerVC = PlayerViewController()
//        self.present(playerVC, animated: true, completion: nil)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passedSegments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "SegmentCellReuse")
        
        let currentSegment = passedSegments[indexPath.row]
        cell.textLabel?.text = currentSegment.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedSegment = passedSegments[indexPath.row]
        playVideo(urlString: selectedSegment.videoURL)
        
    }
    
    func playVideo(urlString: String) {
        let player = AVPlayer(url: URL(string: urlString)!)
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

