// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import SQLite

public protocol SQLitePersistable {
  static var table: Table { get }
  static var tableName: String { get }

  var database: SQLiteDatabase? { get set }
  var persisted: Bool { get }

  static func findAll(in database: SQLiteDatabase) throws -> [Self]
//  static func find(in database: SQLiteDatabase, by id: Int) throws -> Self?
  func save(in database: SQLiteDatabase) throws -> Self?
  func save() throws -> Self?
}

extension SQLitePersistable {
  public static var table: Table {
    return Table(Self.tableName)
  }

  public static var tableName: String {
    return String(describing: self).lowercased().pluralize()
  }
}

extension SQLitePersistable where Self: Codable {
  public static func findAll(in database: SQLiteDatabase) throws -> [Self] {
    let persisted: [Self] = try database.connection.prepare(Self.table).map { row in
      return try row.decode()
    }

    let configured: [Self] = persisted.map { model in
      var model = model
      model.database = database
      return model
    }

    return configured
  }

  public func save(in database: SQLiteDatabase) throws -> Self?  {
    if self.persisted {
      try database.connection.run(Self.table.update(self))
    } else {
      try database.connection.run(Self.table.insert(self))
    }

    return self
  }

  public func save() throws -> Self? {
    guard let database = database else { return nil }

    return try self.save(in: database)
  }
}

extension SQLitePersistable where Self: Codable, Self: Identifiable {
  public var persisted: Bool {
    return id != nil
  }

  public static func find(in database: SQLiteDatabase, by id: Int64) throws -> Self? {
    let query = Self.table.where(Expression<Int64>("id") == id)
    let persisted: [Self] = try database.connection.prepare(query).map { row in
      return try row.decode()
    }

    var model: Self? = persisted.first
    model?.database = database
    return model
  }

  public func find(in database: SQLiteDatabase) throws -> Self? {
    guard let id = id else { return nil }

    return try Self.find(in: database, by: Int64(id))
  }

  public func save(in database: SQLiteDatabase) throws -> Self?  {
    var newSelf: Self?

    if let id = id {
      try database.connection.run(try Self.table.where(Expression<Int64>("id") == Int64(id)).update(self))
      newSelf = try Self.find(in: database, by: Int64(id))
    } else {
      let id = try database.connection.run(Self.table.insert(self))
      newSelf = try Self.find(in: database, by: id)
    }

    return newSelf
  }
}
