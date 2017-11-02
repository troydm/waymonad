module Input
    ( Input (..)
    , inputCreate
    )
where

import Data.IORef (IORef)
import Foreign.Storable (Storable(peek))
import Control.Monad.IO.Class (liftIO)
import Input.Keyboard
import Input.Pointer
import Input.Cursor
import Foreign.Ptr (Ptr)
import Graphics.Wayland.WlRoots.Input
    ( InputDevice
    , inputDeviceType
    , DeviceType(..)
    )
import Graphics.Wayland.WlRoots.Seat (WlrSeat, createSeat, setSeatCapabilities)
import Graphics.Wayland.WlRoots.XCursor (WlrXCursorTheme, WlrXCursor, loadCursorTheme, getCursor , WlrXCursorImage (..), getImages)
import Graphics.Wayland.WlRoots.Cursor (WlrCursor, setCursorImage)
import Graphics.Wayland.Server (DisplayServer(..), seatCapabilityTouch, seatCapabilityKeyboard, seatCapabilityPointer)
import Graphics.Wayland.WlRoots.OutputLayout (WlrOutputLayout)
import Graphics.Wayland.WlRoots.Backend (Backend, backendGetSignals, BackendSignals(..))
import Graphics.Wayland.Signal
    ( addListener
    , WlListener (..)
    , ListenerToken
    )

import Waymonad

data Input = Input
    { inputCursorTheme :: Ptr WlrXCursorTheme
    , inputXCursor :: Ptr WlrXCursor
    , inputCursor :: Cursor
    , inputSeat :: Ptr WlrSeat
    , inputAddToken :: ListenerToken
    }

handleInputAdd :: Ptr WlrCursor -> DisplayServer -> Ptr Backend -> Ptr WlrSeat -> Ptr InputDevice -> IO ()
handleInputAdd cursor dsp backend seat ptr = do
    putStr "Found a new input of type: "
    iType <- inputDeviceType ptr
    print iType
    case iType of
        (DeviceKeyboard kptr) -> handleKeyboardAdd dsp backend seat ptr kptr
        (DevicePointer pptr) -> handlePointer cursor ptr pptr
        _ -> pure ()

setXCursorImage :: Ptr WlrCursor -> Ptr WlrXCursor -> IO ()
setXCursorImage cursor xcursor = do
    images <- getImages xcursor
    image <- peek $ head images

    setCursorImage
        cursor
        (xCursorImageBuffer image)
        (xCursorImageWidth image)
        (xCursorImageWidth image)
        (xCursorImageHeight image)
        (xCursorImageHotspotX image)
        (xCursorImageHotspotY image)

inputCreate :: DisplayServer -> Ptr WlrOutputLayout -> Ptr Backend -> IORef Int -> LayoutCache Input
inputCreate display layout backend currentOut = do
    theme   <- liftIO $ loadCursorTheme "default" 16
    xcursor <- liftIO $ getCursor theme "left_ptr"
    seat    <- liftIO $ createSeat display "seat0"
    cursor  <- cursorCreate layout seat currentOut

    liftIO $ setSeatCapabilities seat [seatCapabilityTouch, seatCapabilityKeyboard, seatCapabilityPointer]

    liftIO $ setXCursorImage
        (cursorRoots $ cursor)
        xcursor


    let signals = backendGetSignals backend
    tok <- liftIO $ addListener (WlListener $ handleInputAdd (cursorRoots cursor) display backend seat) (inputAdd signals)

    pure Input
        { inputCursorTheme = theme
        , inputXCursor = xcursor
        , inputCursor = cursor
        , inputSeat = seat
        , inputAddToken = tok
        }