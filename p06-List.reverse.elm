-- https://johncrane.gitbooks.io/ninety-nine-elm-problems/content/p/p06.html
--Determine if a list is a palindrome, that is, the list is identical when read forward or backward.


module Main exposing (..)

import Html
import List
import Maybe


isPalindrome : List a -> Bool
isPalindrome xs =
    -- your implementation here
    let
        half =
            List.length xs // 2
    in
    List.take half xs == List.take half (reverse xs)



{-
   1::2,3
   (2,3)++1
   ((3)++2)++1
   ((([])++3)++2)++1
-}


reverse : List a -> List a
reverse xs =
    case xs of
        [] ->
            []

        x :: xs ->
            reverse xs ++ x :: []


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ toString x ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ isPalindrome [ 1, 3, 5, 8, 5, 3, 1 ] == True
            , isPalindrome [ 2, 1 ] == False
            , isPalindrome [ 1 ] == True
            , isPalindrome [] == True
            , isPalindrome [ "aa", "bb", "aa" ] == True
            , isPalindrome [ "aab", "b", "aa" ] == False
            , reverse [ 1, 2, 3 ] == [ 3, 2, 1 ]
            ]
