-- Problem 9
-- Convert a list to a list of lists where repeated elements of the source list are packed into sublists. Elements that are not repeated should be placed in a one element sublist.
-- Example
-- pack [1,1,1,2,3,3,3,4,4,4,4,5,6,6] ==
--     [ [1,1,1]
--     , [2]
--     , [3, 3, 3]
--     , [4, 4, 4, 4]
--     , [5]
--     , [6, 6]
--     ]
-- Unit Test
import Html
import List
import Maybe

pack : List a -> List (List a)
pack xs = flatten([],xs)
    -- your implementation goes here

flatten:(List a,List a)->List(List a)
flatten (xsa,xsb) =
    case xsb of
    []->
        []
    _->
        case takeSame (xsa,xsb) of
            (xsa,[])->[xsb]
            (xsa,xsb)->xsa::flatten([],xsb)

takeSame : (List a, List a) -> (List a, List a)
takeSame (xsa,xsb) =
        case xsb of
            []->
                ([],[])
            x0::xs0->
                case xsa of
                    []->
                        takeSame([x0],xs0)
                    x1::xs1->
                        if x0==x1 then takeSame(x0::xsa,xs0)
                        else (xsa,xsb)

main : Html.Html a
main =
    Html.text
        <| case test of
            0 ->
                "Your implementation passed all tests."

            x ->
                "Your implementation failed " ++ (toString x) ++ " tests." ++ toString (flatten ([], [1, 1, 1, 1, 2, 5, 5, 2, 1,1,1]))


test : Int
test =
    List.length
        <| List.filter ((==) False)
            [ pack [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ] == [ [ 1, 1, 1, 1 ], [ 2 ], [ 5, 5 ], [ 2 ], [ 1 ] ]
            , pack [ 2, 1, 1, 1 ] == [ [ 2 ], [ 1, 1, 1 ] ]
            , pack [ 2, 2, 2, 1, 1, 1 ] == [ [ 2, 2, 2 ], [ 1, 1, 1 ] ]
            , pack [ 1 ] == [ [ 1 ] ]
            , pack [] == []
            , pack [ "aa", "aa", "aa" ] == [ [ "aa", "aa", "aa" ] ]
            , pack [ "aab", "b", "b", "aa" ] == [ [ "aab" ], [ "b", "b" ], [ "aa" ] ]
            ]