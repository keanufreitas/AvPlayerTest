//
//  SearchViewController.swift
//  AppleTVTest
//
//  Created by Keanu Freitas on 6/4/18.
//  Copyright © 2018 Keanu Freitas. All rights reserved.
//

import UIKit

//class SearchViewController: UIViewController, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
//
//    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var txtField: UITextField!
//
//    var filteredCourses = [ProfitSystem]()
//    var courses = [CourseElement]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        txtField.becomeFirstResponder()
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        let searchTxt = textField.text ?? ""
//        filteredCourses.removeAll()
//        for movie in filteredCourses {
//            if(movie.title.lowercased().contains(searchTxt.lowercased())){
//                filteredMovies.append(movie)
//            }
//        }
//        collectionView.reloadData()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return filteredCourses.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let tempMovie = filteredCourses[indexPath.row]
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCollectionViewCell
//        cell.thumbnail.adjustsImageWhenAncestorFocused = true
//        cell.thumbnail.sd_setImage(with: URL(string: tempMovie.cover), placeholderImage: #imageLiteral(resourceName: "MissingArtworkMovies.png"), options: [], completed: nil)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        currentMovie = filteredCourses[indexPath.row]
//        if let storyboard = self.storyboard {
//            let vc = storyboard.instantiateViewController(withIdentifier: "showMoviesDetail") as! ViewController
//            self.present(vc, animated: true, completion: nil)
//        }
//    }
//}
