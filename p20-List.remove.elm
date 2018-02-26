-- Remove the nth element from a list.
-- dropAt 3 (List.range 1 10) == [1, 2, 4, 5, 6, 7, 8, 9, 10]


module Main exposing (..)

import Html
import List


{-
   3 1::2,3,4
   2 1::(2::3,4)
   1 1::(2::(4))
-}


dropAt : Int -> List a -> List a
dropAt n list =
    -- your implementation here
    case list of
        [] ->
            []

        x :: list ->
            if n == 1 then
                list
            else
                x :: dropAt (n - 1) list


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            x ->
                "Your implementation failed " ++ toString x ++ " tests." ++ toString (dropAt 3 (List.range 1 14))


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ dropAt 2 [ 1, 2, 5, 5, 2, 1 ] == [ 1, 5, 5, 2, 1 ]
            , dropAt 3 (List.range 1 14) == [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ]
            , dropAt 6 (List.range 1 5) == [ 1, 2, 3, 4, 5 ]
            , dropAt 0 (List.range 1 5) == [ 1, 2, 3, 4, 5 ]
            , dropAt -1 (List.range 1 5) == [ 1, 2, 3, 4, 5 ]
            , dropAt 1 (List.range 1 5) == [ 2, 3, 4, 5 ]
            , dropAt 2 [ "1", "2", "3", "4", "5" ] == [ "1", "3", "4", "5" ]
            ]
