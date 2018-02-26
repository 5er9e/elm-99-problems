-- Determine whether a given integer number is prime.
-- Example:
-- isPrime 113 == True
-- Unit Test


module Main exposing (..)

import Html
import Set


isPrime : Int -> Bool
isPrime n =
    if n < 2 then
        False
    else
        eratos (abs n) (List.range 2 (n // 2))


eratos : Int -> List Int -> Bool
eratos n cs =
    case cs of
        [] ->
            True

        x :: xs ->
            if n % x == 0 then
                False
            else
                eratos n (List.filter (\y -> (y % x) /= 0) xs)


main : Html.Html a
main =
    Html.text <|
        case test of
            [] ->
                "Your implementation passed all tests."

            x ->
                "Your implementation failed " ++ toString (List.length x) ++ " tests: "



--"range 1 1000 " ++ toString (fillPrimes (List.range 2 1000))


test : List ( Bool, Bool )
test =
    List.filter (\x -> Tuple.first x /= Tuple.second x)
        [ ( isPrime 36, False )
        , ( isPrime 10, False )
        , ( isPrime -1, False )
        , ( isPrime 1, False )
        , ( isPrime 0, False )
        , ( isPrime 2, True )
        , ( isPrime 3, True )
        , ( isPrime 4, False )
        , ( isPrime 5, True )
        , ( isPrime 6, False )
        , ( isPrime 7, True )
        , ( isPrime 23, True )
        , ( isPrime 120, False )
        , ( isPrime 997, True )
        , ( isPrime 6000, False )
        , ( isPrime 7919, True )
        , ( isPrime 7911, False )
        , ( isPrime 63247, True )
        ]
