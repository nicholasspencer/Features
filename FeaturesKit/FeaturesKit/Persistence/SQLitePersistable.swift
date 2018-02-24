// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import SQLite

protocol SQLitePersistable: Persistable where Storage.type == SQLiteDatabase {
  static var table: Table { get }
  static var tableName: String { get }
}

extension SQLitePersistable {
  static var table: Table {
    return Table(Self.tableName)
  }

  static var tableName: String {
    return String(describing: self).lowercased().pluralize()
  }

  public static func findAll(in store: Storage, completion: @escaping (Self) throws -> Void) rethrows {

  }

  public func save(in store: Storage, completion: @escaping (Self) throws -> Void) rethrows {

  }
}
