//
//  MoviesCollectionCollectionViewController.swift
//  AppleTVTest
//
//  Created by Keanu Freitas on 6/4/18.
//  Copyright © 2018 Keanu Freitas. All rights reserved.
//

import UIKit
import Foundation

private let reuseIdentifier = "Cell"

class MoviesCollectionCollectionViewController: UICollectionViewController {
    
    var courses = [CourseElement]()
    var profitSystems = [ProfitSystem]()
    var segmentsDecode = [SegmentDecode]()
    var segments = [Segment]()
    
    let coverArts = [ #imageLiteral(resourceName: "4-marketing-system-191"), #imageLiteral(resourceName: "23-start-here"), #imageLiteral(resourceName: "26-direct-mail"), #imageLiteral(resourceName: "27-mls-deal-making-191"), #imageLiteral(resourceName: "29-seller-financing"), #imageLiteral(resourceName: "30-subject-to"), #imageLiteral(resourceName: "32-pocket-listing"), #imageLiteral(resourceName: "33-probate-investing"), #imageLiteral(resourceName: "34-neuro-linguistic-negotiation"), #imageLiteral(resourceName: "35-analytics"), #imageLiteral(resourceName: "37-401k-freedom"), #imageLiteral(resourceName: "38-credit-line"), #imageLiteral(resourceName: "39-estate-planning"), #imageLiteral(resourceName: "41-online-lead-generation"), #imageLiteral(resourceName: "42-mobile-home"), #imageLiteral(resourceName: "43-warrior-mindset"), #imageLiteral(resourceName: "33-probate-investing"), #imageLiteral(resourceName: "be-the-bank"), #imageLiteral(resourceName: "blitz-sales"), #imageLiteral(resourceName: "brandmarketing"), #imageLiteral(resourceName: "cheap-house"), #imageLiteral(resourceName: "compound-cashflow"), #imageLiteral(resourceName: "contract-system"), #imageLiteral(resourceName: "deal-or-no-deal"), #imageLiteral(resourceName: "fearless-flipping"), #imageLiteral(resourceName: "government-compliance"), #imageLiteral(resourceName: "income-streams"), #imageLiteral(resourceName: "irresistable-offer"), #imageLiteral(resourceName: "lead-capture"), #imageLiteral(resourceName: "on-demand-buyers"), #imageLiteral(resourceName: "outsourcing"), #imageLiteral(resourceName: "part-time-profit"), #imageLiteral(resourceName: "payday-profit"), #imageLiteral(resourceName: "private-money"), #imageLiteral(resourceName: "rehabbing"), #imageLiteral(resourceName: "rental-system"), #imageLiteral(resourceName: "repair-estimate"), #imageLiteral(resourceName: "seller-negotation"), #imageLiteral(resourceName: "tax-shrinker"), #imageLiteral(resourceName: "wholesaling") ]

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutCollectionView()
        fetchJSON()
        fetchJSONSegments()
        createObjects()
    }
    
    func layoutCollectionView() {
        collectionView?.frame = CGRect(x: 40, y: 0, width: screenWidth-80, height: screenHeight)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ((screenWidth-80)/5), height: (screenWidth/6)*1.5)
        layout.minimumInteritemSpacing = 30
        collectionView!.collectionViewLayout = layout
    }
    
    fileprivate func fetchJSON() {
        
        let myPathToJsonFile = Bundle.main.path(forResource: "ProfitSystem", ofType: ".json")
        let url = URL(fileURLWithPath: myPathToJsonFile!)
        
                do {
                    let jsonFileData = try Data.init(contentsOf: url)
                    let decoder = JSONDecoder()
                    self.courses = try decoder.decode([CourseElement].self, from: jsonFileData)
                    self.collectionView?.reloadData()
                }
                catch let jsonErr {
                    print("Failed to decode: ", jsonErr)
                }
    }
    
    fileprivate func fetchJSONSegments() {
        
        let myPathToJsonFile = Bundle.main.path(forResource: "Segments", ofType: ".json")
        let url = URL(fileURLWithPath: myPathToJsonFile!)
        
        do {
            let jsonFileData = try Data.init(contentsOf: url)
            let decoder = JSONDecoder()
            self.segmentsDecode = try decoder.decode([SegmentDecode].self, from: jsonFileData)
            self.collectionView?.reloadData()
        }
        catch let jsonErr {
            print("Failed to decode: ", jsonErr)
        }
    }
    
    func createObjects() {
        
        for c in courses {
            for seg in segmentsDecode {
                segments.append(Segment(id: seg.id, name: seg.name, createdAt: seg.createdAt, updatedAt: seg.updatedAt, position: seg.position, learnableID: seg.learnableID, videoURL: seg.videoURL, duration: seg.duration, chapterID: seg.chapterID, wistiaHashedID: seg.wistiaHashedID))
            }
            profitSystems.append(ProfitSystem(title: c.name, cover: c.coverArtFileName,learnID: c.id, segments: segments))
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MoviesCollectionViewCell
        
        let currentMovie = courses[indexPath.row]
        cell.titleLbl.text = currentMovie.name
        cell.thumbnail.adjustsImageWhenAncestorFocused = true
        
        let coverArt = currentMovie.coverArtFileName
        for art in coverArts {

            if art == UIImage(named: coverArt) {
                DispatchQueue.main.async {
                    cell.thumbnail.image = art
                }
                //cell.thumbnail.image = art
            } else {
                print("No match for cover art...")
            }
        }
        cell.accessibilityLabel = currentMovie.name
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let currentMovie = courses[indexPath.row]
        performSegue(withIdentifier: "showMoviesDetail", sender: self)
    }
}
