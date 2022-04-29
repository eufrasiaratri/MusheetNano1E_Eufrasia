//
//  AddSheetViewController.swift
//  Musheet
//
//  Created by Eufrasia Ratri on 28/04/22.
//

import UIKit

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

func fetchMusic() -> [MusicSheet]?
{
    var items: [MusicSheet]? = nil
    do { items = try context.fetch(MusicSheet.fetchRequest()) }
    catch { print(error) }
    return items
}

class AddSheetViewController: UIViewController {

    @IBOutlet weak var TitleTextField: UITextField!
    @IBOutlet weak var ComposerTextField: UITextField!
    @IBOutlet weak var GenreTextField: UITextField!
    @IBOutlet weak var StorageTextField: UITextField!
    
    var items: [MusicSheet]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = fetchMusic()
    }
    
    @IBAction func AddButton(_ sender: UIButton) {
        let newmusic = MusicSheet(context: context )
        newmusic.title = TitleTextField.text
        newmusic.composer = ComposerTextField.text
        newmusic.genre = GenreTextField.text
        newmusic.storage = StorageTextField.text
        
        do {
            try context.save()
        } catch {
            print(error)
        }
        
        items = fetchMusic()
        
        let alert = UIAlertController(title: "Success!", message: "Check My Sheet Page" , preferredStyle: .alert)
        let submitbutton = UIAlertAction(title: "OK", style: .default) { (action) in
            self.performSegue(withIdentifier: "goToTableView", sender: self)
        }
        alert.addAction(submitbutton)
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTableView" {
            let detailVC = segue.destination as? MyMusicSheetViewController
            detailVC?.items = items
        }
    }
}
