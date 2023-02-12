//
//  MyAPOD+CoreDataProperties.swift
//  APOD
//
//  Created by Александр Рахимов on 10.02.2023.
//
//

import Foundation
import CoreData
import UIKit

extension MyAPOD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyAPOD> {
        return NSFetchRequest<MyAPOD>(entityName: "MyAPOD")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: String?
    @NSManaged public var explanation: String?
    @NSManaged public var image: UIImage?

}

extension MyAPOD : Identifiable {

}

extension MyAPOD: ApodElement {
    
}
