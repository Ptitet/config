{
  config,
  lib,
  pkgs,
  inputs,
  flakeRoot,
  ...
}:
let
  generate-desktop-entries =
    let
      crudini = "${pkgs.crudini}/bin/crudini";
    in
    pkgs.writeShellScriptBin "generate-desktop-entries" ''
      get_app_name() {
        desktop_file="$1"
        name=$(${crudini} --get "$desktop_file" "Desktop Entry" "Name[fr]" 2> /dev/null)
        [ -z "$name" ] && name=$(${crudini} --get "$desktop_file" "Desktop Entry" "GenericName[fr]" 2> /dev/null)
        [ -z "$name" ] && name=$(${crudini} --get "$desktop_file" "Desktop Entry" "Name" 2> /dev/null)
        echo "$name"
      }

      IFS=: read -ra data_dirs <<< "$XDG_DATA_DIRS"
      desktop_files=()
      for data_dir in "${"$" + "{data_dirs[@]}"}"; do
        [ ! -d "$data_dir/applications" ] && continue
        desktop_files+=("$data_dir"/applications/*.desktop)
      done
      cache_location=~/.cache/otter-launcher/desktop-entries
      mkdir -p $(dirname "$cache_location")
      rm -f "$cache_location"
      entries=()
      for desktop_file in "${"$" + "{desktop_files[@]}"}"; do
          name=$(get_app_name "$desktop_file")
          echo "$desktop_file|$name" >> "$cache_location"
      done
    '';
in
{
  home.activation.generate-desktop-entries = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run ${generate-desktop-entries}/bin/generate-desktop-entries
  '';

  home.packages = with pkgs; [
    dex
    inputs.otter-launcher.packages."x86_64-linux".default
    wl-mirror
  ];

  xdg.configFile."otter-launcher/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/services/launchers/otter-launcher/config.toml";
}
