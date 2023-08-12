{system, inputs,config, pkgs, ... }: let
  inherit (inputs) hyprland hy3;
  in {

#HYPRLAND BS
wayland.windowManager.hyprland = {
  enable = true;
 # plugins= [ hy3.packages.x86_64-linux.hy3 ] ;
settings = {
    "$mod"="SUPER";

    monitor = [
        "monitor = eDP-1,1366x768@60,0x0,1"
        "monitor = , preferred,auto,1"
        
    ];
    exec-once = [
     "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "hyprctl setcursor Bibata-Modern-Ice 24"
        "wl-paste --watch cliphist store"
        "sleep 0.5s & swww kill & sleep 0.5s & swww init"
        "udiskie &"
        "swww init"
    ];

    input = {
    touchpad = {
       natural_scroll = 0;  
    };
        kb_layout = "us";
           follow_mouse = 1;
        sensitivity = 0.5;
        force_no_accel = 1;
    };

    general = {
      gaps_in = 4;
    gaps_out = 8;
    border_size = 2;
     "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
     layout = "dwindle";
    no_cursor_warps = true;
      
    };

    decoration  = {
    #blur  =  {
    #enabled = true;
   # size = 3;
   # passes = 1;
    #new_optimizations = true;  
   # };
    rounding = 3;
drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(292c3cee)";
    };
# ---------------------------------------------------
    animation = {

    bezier = [
        "smoothOut, 0.36, 0, 0.66, -0.56"
        "smoothIn, 0.25, 1, 0.5, 1"
        "overshot, 0.4, 0.8, 0.2, 1.2"
    ];
    animation = [
        "windows, 1, 4, overshot, slide"
        "windowsOut, 1, 4, smoothOut, slide"
        "border, 1, 10, default"
        "fade, 1,10,smoothIn"
        "fadeDim, 1, 10, smoothIn"
        "workspaces, 1, 4, overshot, slidevert"
      ]; 
    };
# -------------------------------------------------------
    misc = {
    disable_autoreload = true;
    disable_splash_rendering = true;
    mouse_move_enables_dpms = true;
    key_press_enables_dpms =  true;
    disable_hyprland_logo = true;
    };
# ------------------------------------------------------
    binds = {
        workspace_back_and_forth = true;
        allow_workspace_cycles = true;
    };
# -------------------------------------------------------
    dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
    };
# --------------------------------------------------------
    master = {
        new_is_master = true;
        always_center_master = true;
    };

    gestures = { workspace_swipe = false;  };
# --------------------------------------------------------
bind = [
# Exec programs
"$mod, Return, exec, wezterm"
"$mod, space, exec, anyrun"

# Windows Related Controls
"$mod, C, killactive,"
"$mod, M, exit,"
"$mod, V, togglefloating,"
"$mod, P, pseudo, # dwindle"
"$mod, J, togglesplit, # dwindle"
"$mod, F, fullscreen,"
"$mod,Tab,cyclenext,  "        # change focus to another window
"$mod,Tab,bringactivetotop,"   # bring it to the top

# WORKSPACE MOVEMENT
"${builtins.concatStringsSep "\n" (builtins.genList (
       x: let
      ws = let
      c = (x + 1) / 10;
      in
      builtins.toString (x + 1 - (c * 10)); 
  in
  '' 
  bind = $mod, ${ws}, workspace, ${toString (x +1)}
  bind = $modSHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
  '')
  10)}"

# Move focus with mainMod + arrow keys
"$mod, left, movefocus, l"
"$mod, right, movefocus, r"
"$mod, up, movefocus, u"
"$mod, down, movefocus, d"

# Resize active Windows
"CTRL_SHIFT, left, resizeactive,-10 0"    
"CTRL_SHIFT, right,resizeactive,10 0"
"CTRL_SHIFT, up,resizeactive,0 -10"
"CTRL_SHIFT, down,resizeactive,0 10"
   ];


  };  
 }; 
}

