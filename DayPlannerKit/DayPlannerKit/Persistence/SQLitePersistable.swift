// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import SQLite

public protocol SQLitePersistable: Persistable where Storage.type == SQLiteDatabase {
  static var table: Table { get }
  static var tableName: String { get }
}

extension SQLitePersistable where Self: Codable {
  public static var table: Table {
    return Table(Self.tableName)
  }

  public static var tableName: String {
    return String(describing: self).lowercased().pluralize()
  }

  public static func findAll(in store: SQLiteDatabase, completion: ([Self]) -> Void) throws {
    let persitable: [Self] = try store.connection.prepare(Self.table).map { row in
      return try row.decode()
    }
    completion(persitable)
  }

  public func save(in store: SQLiteDatabase, completion: ((Self) -> Void)?) throws {
    try store.connection.run(Self.table.insert(self))
  }
}
