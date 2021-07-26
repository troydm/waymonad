{-# LANGUAGE TemplateHaskell #-}

module WlRoots.Backend where

import WlRoots.Internal.Generate (generateBindings)
  
$(generateBindings "backend")
