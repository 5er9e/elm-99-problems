-- Problem 4
-- Elm provides the function List.length. See if you can implement it yourself.
-- Example
-- countElements [1, 2, 3, 4, 3, 2, 1] == 7

import Html
import List

countElements : List a -> Int
countElements xs =
    -- your implementation here
    List.foldl (\_ n -> n + 1) 0 xs


main : Html.Html a
main =
    Html.text
        <| case test of
            0 ->
                "Your implementation passed all tests."

            x ->
                "Your implementation failed " ++ (toString x) ++ " tests."


test : Int
test =
    List.length
        <| List.filter ((==) False)
            [ countElements (List.range 1 4000) == 4000
            , countElements [ 1 ] == 1
            , countElements [] == 0
            , countElements [ 'a', 'b', 'c' ] == 3
            ]