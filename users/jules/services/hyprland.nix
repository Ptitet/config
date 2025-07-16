{ config, lib, ... }:
{
  options.hyprland.enable = lib.mkEnableOption "Enables Hyprland";

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      withUWSM = true;
      xwayland.enable = true;
    };
    home-manager.users.jules = {
      # xdg.configFile."uwsm/env".source =
      #   "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
      home.sessionVariables = {
        NIXOS_OZONE_WL = "1"; # Hint electron apps to use Wayland
      };
      wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        portalPackage = null;
        systemd.variables = [ "--all" ];
        settings = {
          monitor = [
            "eDP-1, preferred, 0x0, auto"
            "HDMI-A-1, preferred, 43x-1024, auto"
            ", preferred, auto, auto"
          ];
          exec-once = [
            "hyprpaper"
            "ags run --gtk4"
            "hypridle"
            "/home/jules/.scripts/float-bitwarden.sh"
          ];
          env = [
            "XCURSOR_SIZE,24"
            "HYPRCURSOR_SIZE,24"
          ];
          general = {
            gaps_in = 4;
            gaps_out = 6;
            border_size = 1;
            "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            "col.inactive_border" = "rgba(595959aa)";
            resize_on_border = true;
            allow_tearing = true;
            layout = "dwindle";
          };
          decoration = {
            rounding = 7;
            active_opacity = 0.95;
            inactive_opacity = 0.8;
            blur = {
              enabled = true;
              size = 5;
              passes = 1;
              vibrancy = 0.1696;
            };
          };
          animations = {
            enabled = true;

            # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

            animation = [
              "windows, 1, 7, myBezier"
              "windowsOut, 1, 7, default, popin 80%"
              "border, 1, 10, default"
              "borderangle, 1, 8, default"
              "fade, 1, 7, default"
              "workspaces, 1, 3, default"
            ];
          };
          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };
          master.new_status = "master";
          misc = {
            force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
            disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background. :(
            vrr = 0;
          };
          input = {
            kb_layout = "fr";
            numlock_by_default = true;

            follow_mouse = 1;

            sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

            touchpad = {
              natural_scroll = true;
              middle_button_emulation = true;
              drag_lock = true;
            };
          };
          windowrulev2 = [
            "suppressevent maximize, class:.*"

            # Fix some dragging issues with XWayland
            "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

            # disable background transparency on VLC
            "opaque, class:vlc"

            # makes Discord Updater centered
            "center 1, title:Discord Updater"

            # floats file picker
            "float, class:xdg-desktop-portal-gtk"
          ];
          "$mainMod" = "SUPER";
          "$terminal" = "kitty";
          "$fileManager" = "nautilus";
          "$editor" = "zeditor";
          "$browser" = "firefox";
          bind = [
            "$mainMod, C, killactive,"
            "$mainMod, M, exit,"
            "$mainMod, V, togglefloating,"
            "$mainMod, P, pseudo," # dwindle
            "$mainMod, tab, focuscurrentorlast"
            ''$mainMod alt, x, exec, notify-send "Click on a Window to kill it" && hyprctl kill"''
            "$mainMod, T, exec, $terminal"
            "$mainMod, E, exec, $fileManager"
            "$mainMod, space, exec, $menu"
            "$mainMod, Z, exec, $editor"
            "$mainMod, F, exec, $browser"
            "$mainMod, D, exec, discord"
            ", PRINT, exec, hyprshot -m region --clipboard-only" # Select custom region
            "$mainMod, PRINT, exec, hyprshot -m window --clipboard-only # Select window"
            "$mainMod SHIFT, PRINT, exec, hyprshot -m output --clipboard-only # Entire monitor"
            "$mainMod, f11, exec, ags toggle bar"
            ", f11, fullscreen"
            "$mainMod SHIFT, l, exec, hyprlock"
            "$mainMod, h, movefocus, l"
            "$mainMod, l, movefocus, r"
            "$mainMod, k, movefocus, u"
            "$mainMod, j, movefocus, d"
            "$mainMod, right, workspace, +1"
            "$mainMod, left, workspace, -1"
            "$mainMod SHIFT, right, movetoworkspace, +1"
            "$mainMod SHIFT, left, movetoworkspace, -1"
            "$mainMod, mouse_down, workspace, e-1"
            "$mainMod, mouse_up, workspace, e+1"
          ];
          bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
          ];
          bindel = [
            ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1"
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ",XF86MonBrightnessUp, exec, brightnessctl -e set +10%"
            ",XF86MonBrightnessDown, exec, brightnessctl -n -e set 10%-"
          ];
          bindl = [
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPrev, exec, playerctl previous"
          ];
        };
      };
    };
  };
}
