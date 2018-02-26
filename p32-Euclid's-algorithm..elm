-- Determine the greatest common divisor of two positive integer numbers. Use Euclid's algorithm which recurses over the following steps:
-- Given two numbers, a and b divide a by b
-- If the remainder of the division is 0, the numerator is the gcd.
-- else divide the demoninator by the remainder and return to step 2.
-- Example
-- gcd 36 63 = 9
-- Unit Test


module Main exposing (..)

import Html
import List
import Maybe


gcd : Int -> Int -> Int
gcd a b =
    -- Your implementation goes here
    case b of
        0 ->
            a

        _ ->
            gcd (abs b) (a % b)


main =
    Html.text
        (if test then
            "Your implementation passed all tests."
         else
            "Your implementation failed at least one test." ++ toString (gcd 120 -120)
        )


test : Bool
test =
    List.all (\( result, expect ) -> result == expect)
        [ ( gcd 36 63, 9 )
        , ( gcd 10 25, 5 )
        , ( gcd 120 120, 120 )
        , ( gcd 2 12, 2 )
        , ( gcd 23 37, 1 )
        , ( gcd 45 330, 15 )
        , ( gcd 24528 65934, 6 )
        , ( gcd 120 -120, 120 )
        , ( gcd -2 12, 2 )
        , ( gcd 37 23, 1 )
        ]
