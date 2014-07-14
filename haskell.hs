#!/usr/bin/env runhaskell
import Text.Pandoc.JSON

main = toJSONFilter haskell

haskell :: Block -> Block
haskell (CodeBlock (ident, classes, kvps) str)
    | "haskell" `notElem` classes = CodeBlock (ident, "haskell":classes, kvps) str
haskell x = x
