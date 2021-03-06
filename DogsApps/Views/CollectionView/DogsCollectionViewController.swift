//
//  DogsCollectionViewController.swift
//  DogsApps
//
//  Created by Abhishek babladi on 2022-03-30.
//

import UIKit

class DogsCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView?
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow: CGFloat = 2
    var viewModel = {
        DogsListViewModel()
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        initDogListViewModel()
    }
    
    
    func initDogListViewModel() {
        
        // Reload TableView closure
        viewModel.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView?.reloadData()
            }
        }
        
        Task.init{
            await viewModel.getDogsBreeds()
        }
    }
    
    func setupView() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
    }
    
    
}

extension DogsCollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dogsCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = Constants.ReuseIdentifiers.collectionViewIdentifier
        let dogCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        if let cell = dogCell as? DogCollectionViewCell {
            let cellVM = viewModel.getDogCellViewModel(at: indexPath)
            cell.updateLabel(cellViewModel: cellVM)
            return cell
        } else {
            return fatalError("Some error") as! UICollectionViewCell
        }
        
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openDogAttributesController(indexPath: indexPath)
    }
    
    func openDogAttributesController(indexPath:IndexPath){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        guard let resultViewController = storyBoard.instantiateViewController(withIdentifier: "DogAttributesTableViewController") as? DogAttributesTableViewController else {return}
        resultViewController.dogApiData = viewModel.dogs
        resultViewController.id = indexPath
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
}




extension DogsCollectionViewController: UICollectionViewDelegateFlowLayout {
    // 1
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        // 2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    // 3
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return sectionInsets.left
    }
}
