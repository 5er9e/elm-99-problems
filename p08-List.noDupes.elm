-- Problem 8
-- Write a function to remove consecutive duplicates of list elements. 
-- Example
-- noDupes [1, 1, 2, 2, 3, 3, 3, 4, 5, 4, 4, 4, 4]
--     == [1, 2, 3, 4, 5, 4]
-- Unit Test
import Html
import List
import Maybe


noDupes : List a -> List a
noDupes list =
    -- your implementation goes here
    case list of
        [] ->
            []
        x0::xs ->
            case xs of
                [] -> [x0]
                x1::xs  -> 
                if x0 /= x1 then 
                    x0::noDupes (x1::xs)
                else
                    noDupes (x1::xs )
        

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
            [ noDupes [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ] == [ 1, 2, 5, 2, 1 ]
            , noDupes [ 2, 1, 1, 1 ] == [ 2, 1 ]
            , noDupes [ 2, 2, 2, 1, 1, 1 ] == [ 2, 1 ]
            , noDupes [ 1 ] == [ 1 ]
            , noDupes [] == []
            , noDupes [ "aa", "aa", "aa" ] == [ "aa" ]
            , noDupes [ "aab", "b", "b", "aa" ] == [ "aab", "b", "aa" ]
            ]