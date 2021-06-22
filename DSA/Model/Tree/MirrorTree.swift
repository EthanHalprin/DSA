//
//  MirrorTree.swift
//  DSA
//
//  Created by Ethan on 22/06/2021.
//

import Foundation

extension TreeUtils {
    
    func mirrorTree(_ root: inout TNode) {
        
        guard !TreeUtils.isLeaf(root) else { return }
        
        if var left = root.left {
            mirrorTree(&left)
        }
        if var right = root.right {
            mirrorTree(&right)
        }
        
        let aux: TNode? = root.left
        root.left = root.right
        root.right = aux
    }
    
}
