//
//  Note+CoreDataProperties.swift
//  S.Kh_Task_26
//
//  Created by Saba Khitaridze on 26.08.22.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var creationDate: Date?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isFavorite: Bool

}

extension Note : Identifiable {

}
