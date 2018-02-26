-- Rotate a list n places to the left (negative values will rotate to the right). Allow rotations greater than the list length.
-- [rotate 3 (List.range 1 10), rotate 11 (List.range 1 10) ] ,
--   [ [4, 5, 6, 7, 8, 9, 10, 1, 2, 3]
--   , [2, 3, 4, 5, 6, 7, 8, 9, 10, 1]
--   ]


module Main exposing (..)

import Html
import List


rotate : Int -> List a -> List a
rotate rot list =
    case list of
        [] ->
            []

        _ ->
            let
                n =
                    rot % List.length list
            in
            List.drop n list ++ List.take n list



-- % 0 does throu runtime exception now, instead of stack overflow
-- so that is why it did not work in the previous solution. So remember to check for % 0 condition
-- 0 came from List.lenght [], it works here due to [] handling


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
        [ ( rotate 3 [ 1, 2, 5, 5, 2, 1 ], [ 5, 2, 1, 1, 2, 5 ] )
        , ( rotate 13 (List.range 1 10), [ 4, 5, 6, 7, 8, 9, 10, 1, 2, 3 ] )
        , ( rotate 1 (List.range 1 5), [ 2, 3, 4, 5, 1 ] )
        , ( rotate 0 (List.range 1 5), [ 1, 2, 3, 4, 5 ] )
        , ( rotate -1 (List.range 1 5), [ 5, 1, 2, 3, 4 ] )
        , ( rotate -6 (List.range 1 5), [ 5, 1, 2, 3, 4 ] )
        , ( rotate 3 (List.range 1 5), [ 4, 5, 1, 2, 3 ] )

        -- , ( rotate 1 [ "1", "2", "3", "4" ], [ "2", "3", "4", "1" ] )
        , ( rotate 1 [], [] )
        ]
