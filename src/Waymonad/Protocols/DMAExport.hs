module Waymonad.Protocols.DMAExport (getDMAExporterBracket)
where


import Control.Monad.IO.Class (liftIO)
import Foreign.Ptr (Ptr)

import Graphics.Wayland.Server (DisplayServer(..))
import Graphics.Wayland.WlRoots.ExportDMABuf (createDMAExporter)

import Waymonad.Start (Bracketed (..))

getDMAExporterBracket :: Bracketed vs DisplayServer a
getDMAExporterBracket = Bracketed (liftIO . createDMAExporter) (const $ pure ())

