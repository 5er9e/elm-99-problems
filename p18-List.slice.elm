-- https://johncrane.gitbooks.io/ninety-nine-elm-problems/content/p/p18.html
-- Extract a slice from a list.
-- Given a list, return the elements between (inclusively) two indices.
--  Start counting the elements with 1. Indices outside of the list bounds
--  (i.e. negative number, or beyond the length of the list) should be clipped to the bounds of the list.


module Main exposing (..)

import Array
import Html
import List


-- slice 3 7 (List.range 1 10) == (List.range 3 7)
-- slice -7 -3 (List.range 1 10) == []


sublist : Int -> Int -> List a -> List a
sublist start end list =
    -- your implementation goes here
    let
        s =
            max 0 (start - 1)
    in
    List.take (end - s) (List.drop s list)


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            x ->
                "Your implementation failed " ++ toString x ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ True
            , sublist 3 7 (List.range 1 10) == List.range 3 7
            , sublist 2 100 [ 'a', 'b', 'c' ] == [ 'b', 'c' ]
            , sublist -1 2 (List.range 1 100) == [ 1, 2 ]
            , sublist -3 -2 [ -3, -2, -1, 0, 1, 2, 3 ] == []
            , sublist 5 3 [ "indices", " are", "inverted" ] == []
            , sublist 0 1 (List.range 1 10) == [ 1 ]
            , sublist -7 -3 (List.range 1 10) == []
            ]
