//
//  NoteStorageManager.swift
//  S.Kh_Task_26
//
//  Created by Saba Khitaridze on 26.08.22.
//

import UIKit
import CoreData

enum StorageManagerError: Error {
    case managedContextFailed
    case addFailed
    case saveFailed
    case removeFailed
    case editFailed
    case fetchFailed
    case addToFavoritesFailed
}

protocol NoteStorageManagerLogic {
    func getAllNotes() throws -> [Note]
    func addNewNote(withTitle title: String, withText text: String) throws -> Note
    func edit(note: Note, completion: ((Note) -> Void)) throws
    func removeNote(with id: UUID) throws
    func getNote(with id: UUID) throws -> Note?
    func addToFavorites(note: Note) throws
    func removeToFavorites(note: Note) throws
    func getFavoriteNotes() throws -> [Note]
}


class NoteStorageManager: NoteStorageManagerLogic {
    
    //MARK: - Vars
    
    static let shared = NoteStorageManager()
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var managedContext = appDelegate?.persistentContainer.viewContext
    
    //MARK: - Methods
    
    //get all notes
    func getAllNotes() throws -> [Note] {
        guard let managedContext = managedContext else { throw StorageManagerError.managedContextFailed }
        
        do {
            let result = try managedContext.fetch(Note.fetchRequest())
            return result
        } catch {
            throw StorageManagerError.fetchFailed
        }
    }
    
    //add new note
    func addNewNote(withTitle title: String, withText text: String) throws -> Note {
        guard let managedContext = managedContext else { throw StorageManagerError.managedContextFailed }
        let newNote = Note(context: managedContext)
        newNote.id = UUID()
        newNote.title = title
        newNote.text = text
        newNote.creationDate = Date()
        newNote.isFavorite = false
        
        do {
            try managedContext.save()
        } catch {
            throw StorageManagerError.saveFailed
        }
        
        return newNote
    }
    
    //edit note
    func edit(note: Note, completion: ((Note) -> Void)) throws {
        guard let managedContext = managedContext else { throw StorageManagerError.managedContextFailed }
        completion(note)
        do {
            try managedContext.save()
        } catch {
            throw StorageManagerError.editFailed
        }
    }
    
    //remove note
    func removeNote(with id: UUID) throws {
        guard let managedContext = managedContext else { throw StorageManagerError.managedContextFailed }
        let request = Note.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        let result = try managedContext.fetch(request)
        
        if let objectToDelete = result.first {
            managedContext.delete(objectToDelete)
            
            do {
                try managedContext.save()
            } catch {
                throw StorageManagerError.removeFailed
            }
        }
    }
    
    //get specific note
    func getNote(with id: UUID) throws -> Note? {
        guard let managedContext = managedContext else { throw StorageManagerError.managedContextFailed }
        let predicate = NSPredicate(format: "id = %@", id as CVarArg)
        let request = Note.fetchRequest()
        request.predicate = predicate
        
        let result = try managedContext.fetch(request)
        let foundNote = result.first
        
        return foundNote
    }
    
    //MARK: - Favorites
    
    func addToFavorites(note: Note) throws {
        guard let managedContext = managedContext else { throw StorageManagerError.managedContextFailed }
        note.isFavorite = true
        do {
            try managedContext.save()
        } catch {
            throw StorageManagerError.addToFavoritesFailed
        }
    }
    
    func removeToFavorites(note: Note) throws {
        guard let managedContext = managedContext else { throw StorageManagerError.managedContextFailed }
        note.isFavorite = false
        do {
            try managedContext.save()
        } catch {
            throw StorageManagerError.removeFailed
        }
    }
    
    func getFavoriteNotes() throws -> [Note] {
        guard let managedContext = managedContext else { throw StorageManagerError.managedContextFailed }
        let predicate = NSPredicate(format: "isFavorite == %@", NSNumber(booleanLiteral: true))
        let request = Note.fetchRequest()
        request.predicate = predicate
        let result  = try managedContext.fetch(request)
        
        return result
    }
}
