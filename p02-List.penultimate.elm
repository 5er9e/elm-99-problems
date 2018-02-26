-- Implement the function penultimate to find the next to last element of a list.
-- Example
--   penultimate [1, 2, 3, 4] == Just 3
-- Unit Test


module Main exposing (..)

import Html
import List
import Maybe


penultimate : List a -> Maybe a
penultimate list =
    -- your implementation goes here
    case list of
        [] ->
            Nothing

        x :: [ y ] ->
            Just x

        x :: list ->
            penultimate list


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests." ++ toString (penultimate [ "a", "b", "c" ])

            x ->
                "Your implementation failed " ++ toString x ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ penultimate [ 1, 2, 3, 4 ] == Just 3
            , penultimate [ 1, 2 ] == Just 1
            , penultimate [ 1 ] == Nothing
            , penultimate [] == Nothing
            , penultimate [ "a", "b", "c" ] == Just "b"
            , penultimate [ "a" ] == Nothing
            ]
