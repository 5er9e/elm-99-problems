-- Problem 5
-- Elm provides the function List.reverse to reverse the order of elements in a list. See if you can implement it.
-- Example
-- myReverse [1..4] == [4, 3, 2, 1]
-- Unit Test

import Html exposing (text)
import List 


myReverse : List a -> List a
myReverse xs =
    -- your implemenation goes here
    List.foldl (::) [] xs

main : Html.Html a      
main =
    Html.text 
        <| case test of 
            0 -> 
                "Your implementation passed all tests."

            n -> 
                "Your implementation failed " ++ toString n ++ " tests." ++ toString(List.foldl (::) [] [1, 2, 3, 4])


test : Int
test =
    List.length
        <| List.filter ((==) False)
            [ myReverse [1, 2, 3, 4] == [4, 3, 2, 1] 
            , myReverse [2, 1] == [1, 2] 
            , myReverse [1] == [1] 
            , myReverse [] == [] 
            , myReverse [ 'a', 'b', 'c' ] == [ 'c', 'b', 'a' ]
            ]
