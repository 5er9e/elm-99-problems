-- Problem 7
-- Flatten a nested lists into a single list. Because Lists in Elm are homogeneous we need to define what a nested list is.
-- type NestedList a = Elem a | List [NestedList a]
-- Example
-- nl1 =
--     SubList
--         [ Elem 1
--         , SubList
--             [ SubList
--                 [ Elem 2
--                 , SubList [ Elem 3, Elem 4 ]
--                 ]
--             , Elem 5
--             ]
--         , Elem 6
--         , SubList [ Elem 7, Elem 8, Elem 9 ]
--         ]
-- flatten nl1 == List.range 1 9
-- Unit Test


module Main exposing (..)

import Html
import List


type NestedList a
    = Elem a
    | SubList (List (NestedList a))


flatten : NestedList a -> List a
flatten nl = 
    case nl of
        Elem nl ->
            [nl] 
        SubList nl ->
            List.concatMap flatten nl

main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            x ->
                "Your implementation failed " ++ toString x ++ " tests."


nl0 =
    SubList [ Elem 1, Elem 2 ]


nl1 =
    SubList
        [ Elem 1
        , SubList
            [ SubList
                [ Elem 2
                , SubList [ Elem 3, Elem 4 ]
                ]
            , Elem 5
            ]
        , Elem 6
        , SubList [ Elem 7, Elem 8, Elem 9 ]
        ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ flatten nl1 == List.range 1 9
            , flatten (SubList [ Elem 1, Elem 2 ]) == [ 1, 2 ]
            , flatten (SubList [ Elem "a", Elem "b" ]) == [ "a", "b" ]
            , flatten (SubList []) == []
            ]
