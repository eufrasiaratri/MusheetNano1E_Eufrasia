//
//  MyMusicSheetViewController.swift
//  Musheet
//
//  Created by Eufrasia Ratri on 28/04/22.
//

import UIKit

class MyMusicSheetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var SheetTableView: UITableView!
    @IBOutlet weak var AddSheet: UIBarButtonItem!
    
    var items: [MusicSheet]!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        items = fetchMusic()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SheetTableView.delegate = self
        SheetTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MySheetCell", for: indexPath) as! MusicSheetTableViewCell
        cell.Title.text =
            items [indexPath.row].title
        cell.Composer.text =
            items [indexPath.row].composer
        cell.Genre.text =
            items [indexPath.row].genre
        cell.Storage.text =
            items [indexPath.row].storage
        
        
      

        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [self] (action, view, completionHandler) in
                let removedsheet = self.items [indexPath.row]
                self.context.delete(removedsheet)
                
                do {
                    try self.context.save()
                }
                catch {
                    
                }
                
                self.items = self.fetchMusic()
            SheetTableView.reloadData()
            }
            
            return UISwipeActionsConfiguration(actions: [action])
        }
    func fetchMusic() -> [MusicSheet]?
    {
        var items: [MusicSheet]? = nil
        do { items = try context.fetch(MusicSheet.fetchRequest()) }
        catch { print(error) }
        return items
    }
}
