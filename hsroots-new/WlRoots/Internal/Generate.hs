module WlRoots.Internal.Generate (generateBindings) where

import Control.Monad.IO.Class (MonadIO (..))
import Language.C (parseCFilePre)
import Language.C.Syntax.AST
import Language.Haskell.TH (Dec, Q)
import System.IO (hClose, hPutStr)
import System.IO.Temp (withSystemTempFile)
import System.Process (callProcess, readProcess)

handleDecl :: CExtDecl -> [Dec]
handleDecl (CDeclExt (CDecl _ty _subdecls _)) = error "unimplemented"
handleDecl x = error $ "unimplemented:" <> show x

generateBindings :: FilePath -> Q [Dec]
generateBindings header = liftIO $ do
  Right (CTranslUnit decls _) <-
    withSystemTempFile "wlroots-header-include.c" $ \path handle ->
    withSystemTempFile "wlroots-header-include.i" $ \pathi handlei -> do
      hPutStr handle $ "#define WLR_USE_UNSTABLE\n#include <wlr/" <> header <> ".h>"
      hClose handle
      hClose handlei
      flags <- readProcess "pkg-config" ["--cflags", "wlroots", "wayland-server", "pixman-1", "libudev"] ""
      callProcess "cc" $ words flags <> ["-E", path, "-o", pathi]
      parseCFilePre $ pathi
  pure $ foldMap handleDecl decls
