module Test.Spec.Reporter.Codewars (codewarsReporter) where

import Prelude

import Data.Maybe (Maybe(..))
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Time.Duration (Milliseconds(..))
import Effect.Exception (message, stack)
import Test.Spec.Console (tellLn, tellLns)
import Test.Spec.Reporter.Base (defaultReporter)
import Test.Spec.Result as Result
import Test.Spec.Runner (Reporter)
import Test.Spec.Runner.Event as Event

codewarsReporter :: Reporter
codewarsReporter = defaultReporter {} update
  where
  update = case _ of
    Event.Start _ -> pure unit
    Event.End _ -> pure unit
    Event.Suite _ex _path name -> tellLn ("<DESCRIBE::>" <> name)
    Event.SuiteEnd _ -> tellLn "<COMPLETEDIN::>"
    Event.Test _ _ _ -> pure unit

    Event.Pending _path name -> tellLns
      [ "<IT::>" <> name
      , "<LOG::>Pending Test"
      , "<COMPLETEDIN::>"
      ]

    Event.TestEnd _path name (Result.Success _speed (Milliseconds ms)) -> tellLns
      [ "<IT::>" <> name
      , "<PASSED::>Test Passed"
      , "<COMPLETEDIN::>" <> show ms
      ]

    Event.TestEnd _path name (Result.Failure error) -> do
      tellLns
        [ "<IT::>" <> name
        , "<FAILED::>Test Failed<:LF:>" <> escapeLF (message error)
        ]
      case stack error of
        Nothing -> pure unit
        Just k -> tellLn $ "<LOG::-Stack Trace>" <> escapeLF k
      tellLn $ "<COMPLETEDIN::>"

escapeLF :: String -> String
escapeLF = replaceAll (Pattern "\n") (Replacement "<:LF:>")
