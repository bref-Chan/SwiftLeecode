//
//  ImplementQueueUsingStacks.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/22.
//

import Foundation
/**
 请你仅使用两个栈实现先入先出队列。队列应当支持一般队列支持的所有操作（push、pop、peek、empty）：
 实现 MyQueue 类：

 void push(int x) 将元素 x 推到队列的末尾
 int pop() 从队列的开头移除并返回元素
 int peek() 返回队列开头的元素
 boolean empty() 如果队列为空，返回 true ；否则，返回 false
  
 说明：

 你只能使用标准的栈操作 —— 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。
 */

// 1,2,4,5,6
// push push push push pop push pop

// inputStack
// outputStack  2,4,5




class IQUS {
    
    var inputStack : Array<Int>;
    var outputStack : Array<Int>;
        
    /** Initialize your data structure here. */
    init() {
        inputStack = Array.init()
        outputStack = Array.init()
    }
    

    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        //入栈的时候只需要想inputStack里面放入数据
        inputStack.insert(x, at: 0);
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        //出栈的时候先判断outputStack里是否有数据,如果没有数据,将inputStack数据一一出栈然后压入outputStack.因为这里用的数组替代.所以将操作简化为反转即可
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.removeFirst()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.first!;
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
}
