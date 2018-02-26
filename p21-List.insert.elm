-- Insert an element at a given position into a list. Treat the first position as index 1.
-- Example
-- insertAt 2 'l' ['E', 'm'] , ['E', 'l', 'm']
-- Unit Test


module Main exposing (..)

import Html
import List


insertAt : Int -> a -> List a -> List a
insertAt n v xs =
    -- your implementation here
    case xs of
        [] ->
            [ v ]

        x :: xs ->
            if n < 2 then
                v :: x :: xs
            else
                x :: insertAt (n - 1) v xs


main : Html.Html a
main =
    Html.text <|
        case test of
            [] ->
                "Your implementation passed all tests."

            x ->
                "Your implementation failed " ++ toString (List.length x) ++ " tests: " ++ toString x


test : List ( List Int, List Int )
test =
    List.filter (\x -> Tuple.first x /= Tuple.second x)
        [ ( insertAt 2 99 [ 1, 2, 5, 5, 2, 1 ], [ 1, 99, 2, 5, 5, 2, 1 ] )
        , ( insertAt 3 99 (List.range 1 14), [ 1, 2, 99, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ] )
        , ( insertAt 6 99 (List.range 1 5), [ 1, 2, 3, 4, 5, 99 ] )
        , ( insertAt 0 99 (List.range 1 5), [ 99, 1, 2, 3, 4, 5 ] )
        , ( insertAt -1 99 (List.range 1 5), [ 99, 1, 2, 3, 4, 5 ] )
        , ( insertAt 1 99 (List.range 1 5), [ 99, 1, 2, 3, 4, 5 ] )

        --, ( insertAt 2 "x" [ "1", "2", "3", "4", "5" ], [ "1", "x", "2", "3", "4", "5" ] )
        ]
