//
//  Mason.swift
//  Mason
//
//  Created by monsoir on 1/30/21.
//

import Foundation

public struct Mason {
    /// 将模型数据转换为 JSON 字符串
    /// - Parameter value: 待转换对象
    public static func stringify<T: Encodable>(_ value: T) throws -> String? {
        let jsonData = try JSONEncoder().encode(value)
        let result = String(data: jsonData, encoding: .utf8)
        return result
    }

    /// 将 JSON 字符串转换为模型数据
    /// - Parameters:
    ///   - value: 待转换的 JSON 字符串
    ///   - type: 模型类型
    public static func parse<T: Decodable>(_ value: String, type: T.Type) throws -> T? {
        guard let data = value.data(using: .utf8) else { throw CorruptedData() }
        let result = try JSONDecoder().decode(type, from: data)
        return result
    }

    /// 将模型数据转换为 JSON 数据
    /// - Parameter value: 待转换的模型数据
    public static func jsonify<T: Encodable>(_ value: T) throws -> Any {
        let encodedData = try JSONEncoder().encode(value)
        let result = try JSONSerialization.jsonObject(with: encodedData, options: [])
        return result
    }

    /// 将 JSON 数据转换为模型数据
    /// - Parameters:
    ///   - value: 待转换 JSON 数据
    ///   - type: 模型类型
    public static func parse<T: Decodable>(_ value: Any, type: T.Type) throws -> T {
        let jsonObject = try JSONSerialization.data(withJSONObject: value, options: [])
        let result = try JSONDecoder().decode(type, from: jsonObject)
        return result
    }

    /// 将裸数据转换为模型数据
    /// - Parameters:
    ///   - value: 待转换的裸数据
    ///   - type: 模型类型
    public static func parse<T: Decodable>(_ value: Data, type: T.Type) throws -> T {
        let result = try JSONDecoder().decode(type, from: value)
        return result
    }
}

extension Mason {
    public struct CorruptedData: Swift.Error {}

    public struct InvalidJSONData: Swift.Error {}
}
