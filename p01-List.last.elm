-- Let's create a more complete test, checking last against an empty list and lists of different types.
-- We will use assertEqual which takes a tuple, where the first element will hold a test condition and
-- the second holds the expected result. This will allow us to test multiple conditions concisely.
-- Cut and paste the following code into the online compiler http://elm-lang.org/try.
-- Insert your implementation of last and test.


module Main exposing (..)

import Html
import List
import Maybe


last : List a -> Maybe a
last xs =
    -- your implementation goes here
    case xs of
        [] ->
            Nothing

        [x] ->
            Just x

        x :: xs ->
            last xs


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
            [ last (1..4) == Just 4
            , last [ 1 ] == Just 1
            , last [] == Nothing
            , last [ 'a', 'b', 'c' ] == Just 'c'
            ]

(..) : Int -> Int -> List Int
(..) start end =
    List.range start end
