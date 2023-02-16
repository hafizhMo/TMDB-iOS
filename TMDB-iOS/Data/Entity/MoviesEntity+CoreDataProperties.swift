//
//  MoviesEntity+CoreDataProperties.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 15/02/23.
//
//

import Foundation
import CoreData

extension MoviesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesEntity> {
        return NSFetchRequest<MoviesEntity>(entityName: "MoviesEntity")
    }

    @NSManaged public var title: String

}

extension MoviesEntity: Identifiable {}
