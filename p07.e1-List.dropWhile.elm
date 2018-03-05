-- Extra #1 - dropWhile
-- Drop items from the start of a list until an item does not satisfy criteria specified by a function.
-- Example
-- dropWhile isEven [2, 4, 5, 6, 7] == [5, 6, 7]
-- Unit Test
import Html 
import List


dropWhile : (a -> Bool) -> List a -> List a
dropWhile predicate list =
    -- your implementation here
     case list of
        [] ->
            []
        x::list ->
            if predicate x then 
                dropWhile predicate list
            else x::list
                


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
            [ ( dropWhile isOdd [1, 2, 1] == [2, 1] )
            , ( dropWhile isEven [1, 2, 1] == [1, 2, 1] )
            , ( dropWhile isEven [] == [] )
            , ( dropWhile isEven [2, 4, 100000, 1] == [1] )
            , ( dropWhile ((>) 5 ) (List.range 1 10) == [5, 6, 7, 8, 9, 10])
            , ( dropWhile ((>) 50 ) (List.range 1 10) ==[])
            ]


isEven x = 
    x % 2 == 0


isOdd x = 
    x % 2 /= 0