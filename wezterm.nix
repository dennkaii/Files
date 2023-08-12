{inputs, config, pkgs, ...}:
{
  programs.wezterm = {
    enable = true;
    extraConfig =''

    local wezterm = require ("wezterm")

            local function font_with_fallback(name, params)
              local names = { name, "Material Symbols Outlined"}
              return wezterm.font_with_fallback(names, params)

              end

              local font_name = "Mononoki Nerd Font"

            return {
              font_size = 12,
               font = font_with_fallback(font_name) ,
              color_scheme = "Brogrammer",
              enable_wayland = true,
              automatically_reload_config = true,
              warn_about_missing_glyphs = false,
              enable_scroll_bar = false,
              enable_tab_bar = false,
              window_background_opacity = 0.7,
              window_close_confirmation = "NeverPrompt",
              window_padding = {
                left = 25,
                right = 25,
                top = 25,
                bottom = 25,
              },
              default_cursor_style = "SteadyBar",

            } 
    
    '';
  };
}
