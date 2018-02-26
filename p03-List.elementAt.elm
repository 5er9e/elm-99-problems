-- Implement the function elementAt to return the n-th element of a list. The index is 1-relative, that is, the first element is at index 1.
-- Example:
-- elementAt [3, 4, 5, 6] 2 == Just 4
-- Unit Test


module Main exposing (..)

import Html
import List
import Maybe


elementAt : List a -> Int -> Maybe a
elementAt xs n =
    -- your implementation here
    case xs of
        [] ->
            Nothing

        x :: xs ->
            if n > 1 then
                elementAt xs (n - 1)
            else if n == 1 then
                Just x
            else
                Nothing


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
            [ elementAt [ 1, 2, 3, 4 ] 2 == Just 2
            , elementAt [ 1 ] 2 == Nothing
            , elementAt [ 1 ] 1 == Just 1
            , elementAt [] 2 == Nothing
            , elementAt [] -1 == Nothing
            , elementAt [] 0 == Nothing
            , elementAt [ 1, 2, 3, 4 ] -1 == Nothing
            , elementAt [ 1, 2, 3, 4 ] 0 == Nothing
            , elementAt [ 'a', 'b', 'c' ] 2 == Just 'b'
            ]
