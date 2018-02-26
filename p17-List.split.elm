-- https://johncrane.gitbooks.io/ninety-nine-elm-problems/content/p/p17.html
-- Split a list into two lists. The length of the first part is specified by the caller.


module Main exposing (..)

import Html exposing (text)
import List


--split (List.range 1 10) 3 == ([1, 2, 3], [4, 5, 6, 7, 8, 9, 10])


split : List a -> Int -> ( List a, List a )
split list count =
    -- your implementation here
    ( take count list, drop count list )



{-
   2   1::2,3
   1   1::(2::3)
   0   1::(2::([]))
-}


take : Int -> List a -> List a
take count list =
    case list of
        [] ->
            []

        x :: list ->
            if count <= 0 then
                []
            else
                x :: take (count - 1) list



{-
   2   1::2,3
   1   2::3
   0   3::[]
-}


drop : Int -> List a -> List a
drop count list =
    case list of
        [] ->
            []

        x :: list ->
            if count <= 0 then
                x :: list
            else
                drop (count - 1) list


main =
    text
        (if test then
            "Your implementation passed all tests."
         else
            "Your implementation failed at least one test." ++ toString (take 2 [ 1, 2, 3 ]) ++ toString (drop 2 [ 1, 2, 3 ])
        )


test : Bool
test =
    List.all (\( result, expect ) -> result == expect)
        [ ( split (List.range 1 5) 0, ( [], [ 1, 2, 3, 4, 5 ] ) )
        , ( split (List.range 1 5) 2, ( [ 1, 2 ], [ 3, 4, 5 ] ) )
        , ( split (List.range 1 5) 3, ( [ 1, 2, 3 ], [ 4, 5 ] ) )
        , ( split (List.range 1 5) 4, ( [ 1, 2, 3, 4 ], [ 5 ] ) )
        , ( split (List.range 1 5) 5, ( [ 1, 2, 3, 4, 5 ], [] ) )
        , ( split (List.range 1 5) 6, ( [ 1, 2, 3, 4, 5 ], [] ) )
        , ( split (List.range 1 5) -1, ( [], [ 1, 2, 3, 4, 5 ] ) )
        ]
        && List.all (\( result, expect ) -> result == expect)
            [ ( split [ "aab", "b", "c", "aa" ] 2, ( [ "aab", "b" ], [ "c", "aa" ] ) )
            ]
        && List.all (\( result, expect ) -> result == expect)
            [ ( take 2 [ 1, 2, 3, 4, 5 ], [ 1, 2 ] )
            , ( drop 2 [ 1, 2, 3, 4, 5 ], [ 3, 4, 5 ] )
            ]
