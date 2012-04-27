import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders(smartBorders)
import XMonad.Config.Gnome
import qualified XMonad.StackSet as W


myTerminal = "terminator"

myWorkspaces  = ["1:web","2:code","3:runners","4:Pidgin","5:windoze", "6:chat", "7:media"]

myLayout = onWorkspace "4:Pidgin" pidginLayout $ tiled1 ||| Mirror tiled1 ||| nobordersLayout  
 where  
  tiled1          = spacing 5 $ Tall nmaster1 delta ratio
  nmaster1        = 1
  nmaster2        = 2
  ratio           = 2/3
  delta           = 3/100
  nobordersLayout = smartBorders $ Full
  gridLayout      = spacing 8 $ Grid
  pidginLayout    = withIM (18/100) (Role "buddy_list") gridLayout

myManageHook = composeAll       
      [ className =? "File Operation Progress" --> doFloat
      , resource  =? "desktop_window"          --> doIgnore
      , className =? "xfce4-notifyd"           --> doIgnore
      , appName   =? "chromium"                --> doShift "1:web"
      , appName   =? "gvim"                    --> doShift "2:code"
      , appName   =? "terminator"              --> doShift "3:runners"
      , className =? "Pidgin"                  --> doShift "4:Pidgin"
      , className =? "Firefox"                 --> doShift "5:windoze"
      , appName   =? "rhythmbox"               --> doShift "5:windoze"
      ]  

myKeys :: [(String, X())]
myKeys = [ 
      ("M-n"  , spawn "touch ~/.pomodoro_session; echo 'touched file'")
    , ("M-S-o", spawn "sleep 0.2; scrot -s")
    , ("M-o"  , spawn "scrot")
    ]

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
    { 
      manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ myLayout
    , workspaces = myWorkspaces
    , terminal   = myTerminal
    , logHook    = dynamicLogWithPP $ xmobarPP
      { ppOutput   = hPutStrLn xmproc
        , ppTitle  = xmobarColor "green" "" . shorten 50
      }
    } `additionalKeysP` myKeys



