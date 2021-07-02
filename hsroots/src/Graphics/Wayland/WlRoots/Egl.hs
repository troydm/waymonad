{-# LANGUAGE EmptyDataDecls #-}
module Graphics.Wayland.WlRoots.Egl
    ( EGL
    , eglCreate
    , eglBindDisplay
    )
where

import Data.Composition ((.:))
import Graphics.Wayland.Server (Display)
import Graphics.Egl (Platform, getPlatform)
import Foreign.Ptr (Ptr)
import Foreign.C.Types (CInt(..))
import Foreign.C.Error (throwErrnoIf_, throwErrnoIfNull)

data EGL


foreign import ccall safe "wlr_egl_create" c_egl_create :: CInt -> Ptr a -> IO (Ptr EGL)

eglCreate :: Platform -> Ptr a -> IO (Ptr EGL)
eglCreate p d = let num = getPlatform p in
    throwErrnoIfNull "eglCreate" (c_egl_create num d)


foreign import ccall safe "wlr_egl_bind_display" c_egl_bind_display :: Ptr EGL -> Ptr Display -> IO Bool

eglBindDisplay :: Ptr EGL -> Ptr Display -> IO ()
eglBindDisplay =
    throwErrnoIf_ not "eglBindDisplay" .: c_egl_bind_display

-- TODO: wlr_egl_query_buffer



