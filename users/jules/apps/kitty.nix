{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.apps.kitty;
in
{
  options.my.apps.kitty.enable = lib.mkEnableOption "Enables kitty";

  config.programs.kitty = lib.mkIf cfg.enable {
    enable = true;
    shellIntegration = {
      mode = "no-sudo"; # https://mynixos.com/home-manager/option/programs.kitty.shellIntegration.mode
      enableZshIntegration = true;
    };
    enableGitIntegration = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 10;
      package = pkgs.nerd-fonts.fira-code;
    };
    settings = {
      font_features = "FiraCodeNF-Reg +ss04 +ss03 +cv16 +cv31 +cv29 +cv30 +ss02 +ss06";
      cursor_shape_unfocused = "unchanged";
      cursor_beam_thickness = 1;
      cursor_blink_interval = -1;
      cursor_stop_blinking_after = 0;
      mouse_hide_wait = -1;
      url_color = "#c2c2c2";
      url_style = "straight";
      show_hyperlink_targets = "yes";
      strip_trailing_spaces = "always";
      enable_audio_bell = "no";
      window_padding_width = 5;
      placement_strategy = "top-left";
      hide_window_decorations = "yes";
      tab_bar_style = "powerline";
      close_on_child_death = "yes";
      wayland_enable_ime = "no";
      linux_display_server = "wayland";
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+shift+=" = "change_font_size all +1.0";
      "ctrl+=" = "change_font_size all -1.0";
      "ctrl+alt+=" = "change_font_size all 0";
    };
  };
}
