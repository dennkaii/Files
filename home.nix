{ inputs, config, pkgs, ... }:let
inherit (inputs) anyrun hyprland hy3 ags; 
in {

  home.username = "he";
  home.homeDirectory = "/home/he";
  home.stateVersion = "23.05";

 imports =[ anyrun.homeManagerModules.default
./programs/hyprland.nix
./programs/wezterm.nix ];
#hyprland.homeManagerModules.default ] ;
 
 programs.home-manager.enable = true;



  home.packages = with pkgs; [

    ranger
    vivaldi    
    swww
    wine
    pavucontrol
    blueman
    starship
    eww-wayland
    xdg-desktop-portal-hyprland
    vulkan-tools
    cliphist
    gamescope
    logseq
    wireplumber
    nwg-dock-hyprland

    
    betterdiscordctl
    (pkgs.discord.override {
  # remove any overrides that you don't want
  withOpenASAR = true;
  withVencord = true;
})

    font-manager
    xarchiver


    
    socat
    inputs.ags.packages.${pkgs.system}.default
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast

    (lutris.override {
      extraPkgs = pkgs: [
        winetricks
        winePackages.fonts
        wineWowPackages.waylandFull       
      ];
    }) 
  ];

gtk.enable =true;

gtk.cursorTheme.package = pkgs.bibata-cursors;
gtk.cursorTheme.name = "Bibata-Modern-Ice";
gtk.theme.package = pkgs.colloid-gtk-theme;
gtk.theme.name = "Colloid";

gtk.iconTheme.package  = pkgs.papirus-icon-theme;
gtk.iconTheme.name = "Papirus-Dark";

    gtk.gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    
    gtk.gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };


programs.helix = {
  enable = true;
  defaultEditor = true;
  settings = {
    theme = "base16_transparent";
    editor = {
      line-number = "relative"; 
    };
    editor.statusline = {
      left = ["mode" "spinner" "separator"];
      center = ["file-name"];
      right = ["separator" "diagnostics" "spacer" "position" "file-type" "version-control"];

      separator = "│";
      mode.normal = "NOR";
      mode.insert = "EDT";
      mode.select = "SEL";
    };
      };
};

#ANYRUN
programs.anyrun = {
  enable = true;
   
  config = {
  closeOnClick = true;
  hidePluginInfo = true;
  width.fraction = 0.3;
  y.fraction = 0.3;
 plugins = with inputs.anyrun.packages.${pkgs.system}; [
    applications
    rink
    translate
    websearch
    ];

  };
  extraCss = ''

  #window,
      #match,
      #entry,
      #plugin,
      #main {
        background: transparent;
      }

       #match:selected {
        background: rgba(203, 166, 247, 0.7);
      }

      #match {
        padding: 3px;
        border-radius: 5px;
      }

      #entry, #plugin:hover {
        border-radius: 16px;
      }

      box#main {
        background: rgb(30, 30, 46);
        border: 1px solid #1c272b;
        border-radius: 24px;
        padding: 8px;
      }

  '';
};
}
