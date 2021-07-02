module Graphics.Wayland.WlRoots.LinuxDMABuf
    ( LinuxDMABuf (..)
    , createDMABuf
    )
where

import Foreign.Ptr (Ptr)
import Foreign.C.Error (throwErrnoIfNull)

import Graphics.Wayland.Server (DisplayServer(..))

import Graphics.Wayland.WlRoots.Render (Renderer)
import Graphics.Wayland.WlRoots.Backend (Backend, backendGetRenderer)

newtype LinuxDMABuf = LinuxDMABuf (Ptr LinuxDMABuf)

foreign import ccall safe "wlr_linux_dmabuf_v1_create" c_create :: Ptr DisplayServer -> Ptr Renderer -> IO (Ptr LinuxDMABuf)

createDMABuf :: DisplayServer -> Ptr Backend -> IO LinuxDMABuf
createDMABuf (DisplayServer dsp) backend =
    LinuxDMABuf <$> throwErrnoIfNull "creatELinuxDMABuf" (c_create dsp =<< backendGetRenderer backend)
