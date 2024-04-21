//
//  Queue.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/04/10.
//

import Foundation

struct Queue<T>{
    fileprivate var inbox: [T] = []
    fileprivate var outbox: [T] = []
    init(inbox: [T] = [], outbox: [T] = []) {
        self.inbox = inbox
        self.outbox = outbox
    }
    var isEmpty: Bool{
        return outbox.isEmpty && inbox.isEmpty
    }
    var front: T?{
        return outbox.isEmpty ? inbox.first : outbox.last
    }
    var rear: T?{
        if outbox.isEmpty { return inbox.last }
        return outbox.first
    }
    var count: Int{
        return outbox.count + inbox.count
    }
    mutating func enqueue(element: T){
        inbox.append(element)
    }
    mutating func dequeue()->T?{
        if outbox.isEmpty{
            //outbox.isEmpty == true 일때만 O(n)인 reverse()를 사용하기때문에 전체적으로는 O(1)이라고 할 수 있음
            outbox = inbox.reversed()
            //Array.removeAll()은 keepingCapacity가 false일 때, O(1)의 Performance를 갖는다.
            //https://stackoverflow.com/questions/54133045/performance-array-removeall-vs
            inbox.removeAll()
        }
        return outbox.popLast()
    }
    mutating func popLast()->T?{
        if isEmpty {return nil}
        if outbox.isEmpty{
            let ret = outbox.first
            outbox.removeFirst()
            return ret
        }
        return inbox.popLast()
    }
}
