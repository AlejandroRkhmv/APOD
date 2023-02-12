//
//  ExtensionForMyApodsVC.swift
//  APOD
//
//  Created by Александр Рахимов on 10.02.2023.
//

import UIKit
import CoreData

extension MyApodsViewController {
    
    func createTable() {
        addTableToView()
        setTableViewConstraints()
    }
    
    private func addTableToView() {
        table = MyApodsView()
        table?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table?.translatesAutoresizingMaskIntoConstraints = false
        table?.delegate = self
        table?.dataSource = self
        view.addSubview(table!)
    }
    
    private func setTableViewConstraints() {
        table?.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        table?.heightAnchor.constraint(equalToConstant: view.frame.size.height - 100).isActive = true
        table?.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        table?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
    func createDeleteButton() {
        let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteButtonTapped))
        deleteButton.tintColor = .black
        navigationItem.rightBarButtonItem = deleteButton
    }
    
    @objc
    private func deleteButtonTapped() {
        let fetchRequest: NSFetchRequest<MyAPOD> = MyAPOD.fetchRequest()
        if let apods = try? myApodPresenter.context.fetch(fetchRequest) {
            for apod in apods {
                myApodPresenter.context.delete(apod)
            }
        }
        do {
            try myApodPresenter.context.save()
            table?.reloadData()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func initializationFC() {
        print("qwe")
        let fetchRequest: NSFetchRequest<MyAPOD> = MyAPOD.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(MyAPOD.date), ascending: true)
        fetchRequest.fetchLimit = 15
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                           managedObjectContext: myApodPresenter.context,
                                                           sectionNameKeyPath: nil,
                                                           cacheName: nil)
        //fetchResultController.delegate = self
        do {
            try fetchResultController.performFetch()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func customBackButton() {
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Go back", style: .plain, target: self, action: #selector(pop))
        newBackButton.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc
    func pop() {
        myApodPresenter.router?.popViewController()
    }
}

extension MyApodsViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .delete:
            guard let indexPath = indexPath else { return }
            table?.deleteRows(at: [indexPath], with: .fade)
            table?.reloadData()
        default: break
        }
    }
}

extension MyApodsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let apod = fetchResultController.object(at: indexPath)
        myApodPresenter.router?.pushApodViewController(object: apod, context: myApodPresenter.context)
    }
}

extension MyApodsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "MyAPODs"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchResultController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchResultController.sections?[section]
        guard let rows = sectionInfo?.numberOfObjects else { return 0 }
        return rows
        
//        let fetchRequest: NSFetchRequest<MyAPOD> = MyAPOD.fetchRequest()
//        if let apods = try? myApodPresenter.context.fetch(fetchRequest) {
//            return apods.count
//        }
//        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let apod = fetchResultController.object(at: indexPath)
        
//        let fetchRequest: NSFetchRequest<MyAPOD> = MyAPOD.fetchRequest()
//        guard let apods = try? myApodPresenter.context.fetch(fetchRequest) else { return cell }
//        let apod = apods[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = apod.title
        content.secondaryText = apod.date
        content.image = apod.image
        content.imageProperties.maximumSize.width = 50
        content.imageProperties.maximumSize.height = 50
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let apod = fetchResultController.object(at: indexPath)
            myApodPresenter.context.delete(apod)
            
            do {
                try myApodPresenter.context.save()
                tableView.reloadData()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}

extension MyApodsViewController: IMyApodsViewController {
    func reloadMyApodsTable() {
        table?.reloadData()
    }
}
