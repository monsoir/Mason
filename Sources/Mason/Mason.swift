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
    public static func stringify<T: Encodable>(_ value: T) -> String? {
        guard let jsonData = try? JSONEncoder().encode(value) else { return nil }
        let result = String(data: jsonData, encoding: .utf8)
        return result
    }

    /// 将 JSON 字符串转换为模型数据
    /// - Parameters:
    ///   - value: 待转换的 JSON 字符串
    ///   - type: 模型类型
    public static func parse<T: Decodable>(_ value: String, type: T.Type) -> T? {
        guard let data = value.data(using: .utf8) else { return nil }
        guard let result = try? JSONDecoder().decode(type, from: data) else { return nil }
        return result
    }

    /// 将模型数据转换为 JSON 数据
    /// - Parameter value: 待转换的模型数据
    public static func jsonify<T: Encodable>(_ value: T) -> Any? {
        guard let encodedData = try? JSONEncoder().encode(value) else { return nil }
        guard let result = try? JSONSerialization.jsonObject(with: encodedData, options: []) else { return nil }
        return result
    }

    /// 将 JSON 数据转换为模型数据
    /// - Parameters:
    ///   - value: 待转换 JSON 数据
    ///   - type: 模型类型
    public static func parse<T: Decodable>(_ value: Any, type: T.Type) -> T? {
        guard JSONSerialization.isValidJSONObject(value) else {
            debugPrint("input is not valid json object")
            return nil
        }
        guard let jsonObject = try? JSONSerialization.data(withJSONObject: value, options: []) else { return nil }
        guard let result = try? JSONDecoder().decode(type, from: jsonObject) else { return nil }
        return result
    }

    /// 将裸数据转换为模型数据
    /// - Parameters:
    ///   - value: 待转换的裸数据
    ///   - type: 模型类型
    public static func parse<T: Decodable>(_ value: Data, type: T.Type) -> T? {
        guard let result = try? JSONDecoder().decode(type, from: value) else { return nil }
        return result
    }
}
