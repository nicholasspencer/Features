// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public struct Contact: Codable, TimeStampable {
  public var id = UUID()
  public var createdAt: Date?
  public var updatedAt: Date?
  public var deletedAt: Date?
  
  public var name: String?
  public var address: String?
  public var phone: String?
  public var favorite: Bool = false
}

extension Contact: SQLitePersistable {
  public typealias Storage = SQLiteDatabase
}
