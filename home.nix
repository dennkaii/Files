{ inputs, config, pkgs, ... }:let
inherit (inputs) anyrun schizofox hyprland hy3 ags armcord-hm; 
in{

  # home.username = "dennkaii";
  # home.homeDirectory = "/home/dennkaii";
  # home.stateVersion = "23.05";
ome.packages = with pkgs;[
  # floorp
  #armcord
  

home.packages = with pkgs;[
  # floorp
  #armcord
  # vivaldi
  inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  libreoffice-fresh
  gamescope
  wireplumber
  wine
  vulkan-tools
  pavucontrol
  gnome.nautilus
  tidal-hifi


  
    (lutris.override {
      extraPkgs = pkgs: [
#Gamescope things
      xorg.libXcursor
        xorg.libXi
        xorg.libXinerama

        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils

        
        winetricks
        winePackages.fonts
        wineWowPackages.waylandFull
         gst_all_1.gstreamer
          # Common plugins like "filesrc" to combine within e.g. gst-launch
          gst_all_1.gst-plugins-base
          # Specialized plugins separated by quality
          gst_all_1.gst-plugins-good
          gst_all_1.gst-plugins-bad
          gst_all_1.gst-plugins-ugly
          # Plugins to reuse ffmpeg to play almost every video format
          gst_all_1.gst-libav
          # Support the Video Audio (Hardware) Acceleration API
          gst_all_1.gst-vaapi     
      ];
    }) 

  swww
];

home.file.".ssh/allowed_signers".text =
    "* ${builtins.readFile ./id_ed25519.pub}";


programs.git = {
  enable = true;
  userName = "dennkaii";
  userEmail = "70287696+dennkaii@users.noreply.github.com";

  extraConfig = {
    commit.gpgsign = true;
    gpg.format = "ssh";
    gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    user.signingkey = "~/.ssh/id_ed25519.pub";
    
  };
  
};


  imports = [
   anyrun.homeManagerModules.default
  schizofox.homeManagerModules.default
  armcord-hm.homeManagerModules.default  ];

  programs.zellij = {
    enable = true;
    settings  = {
    default_shell =  "fish";
      theme = "default";
      simplified_ui = true;
      default_layout = "compact";
            };
      #Not working the fish integration hm module
    # enableFishIntegration = true;
     enableFishIntegration = true;
  };


#   programs.fish = {enable = true;
#   interactiveShellInit = ''
#    set fish_greeting # Disable greeting

#   if not set -q ZELLIJ                                                                                                                                                           
#     if test "$ZELLIJ_AUTO_ATTACH" = "true"                                                                                                                                     
#         zellij attach -c                                                                                                                                                       
#     else                                                                                                                                                                       
#         zellij                                                                                                                                                                 
#     end                                                                                                                                                                        
                                                                                                                                                                               
#     if test "$ZELLIJ_AUTO_EXIT" = "true"                                                                                                                                       
#         kill $fish_pid                                                                                                                                                         
#     end                                                                                                                                                                        
# end
#      '';};



#   programs.armcord = {
#     enable = true;
#         armcordSettings = {
#       # here's mine:
#       alternativePaste = false;
#       armcordCSP = true;
#       automaticPatches = false;
#       channel = "stable";
#       disableAutogain = true;
#       minimizeToTray = false;
#       multiInstance = false;
#       performanceMode = "performance";
#       skipSplash = true;
#       spellcheck = true;
#       startMinimized = false;
#       tray = true;
#       trayIcon = "default";
#       useLegacyCapturer = false;
#       # windowStyle = "transparent";
#     };


#     };


# programs.schizofox = {
#   enable = true;

#   # theme = {
#   #   background-darker = "181825";
#   #   # background = "1e1e2e";
#   #   # foreground = "cdd6f4";
#   #   font = "Lexend";
#   #   simplefox.enable = true;
#   #   darkreader.enable = true;
#   #   # extraCss = ''
#   #   #   body {
#   #   #     color: red !important;
#   #   #   }
#   #   # '';
#   # };


#   };

#   programs.anyrun = {
#   enable = true;
   
#   config = {
#   closeOnClick = true;
#   hidePluginInfo = true;
#   width.fraction = 0.3;
#   y.fraction = 0.3;
#  plugins = with inputs.anyrun.packages.${pkgs.system}; [
#     applications
#     rink
#     translate
#     websearch
#     ];

#   };
#   extraCss = ''

#   #window,
#       #match,
#       #entry,
#       #plugin,
#       #main {
#         background: transparent;
#       }

#        #match:selected {
#         background: rgba(203, 166, 247, 0.7);
#       }

#       #match {
#         padding: 3px;
#         border-radius: 5px;
#       }

#       #entry, #plugin:hover {
#         border-radius: 16px;
#       }

#       box#main {
#         background: rgb(30, 30, 46);
#         border: 1px solid #1c272b;
#         border-radius: 24px;
#         padding: 8px;
#       }

#   '';
# };
  

}
