{
  description = "The best launcher in the universe";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
        pname = "keal";
        version = "0.0.1";

        src = pkgs.fetchFromGitHub {
          owner = "davawen";
          repo = "keal";
          rev = "000f3d7";
          hash = "sha256-oQj22yRy40cwSLL8EcgamVUn0IbBDWVMqKGPYYzMWjk=";
        };

        sourceRoot = "${finalAttrs.src.name}/keal_iced";

        nativeBuildInputs = with pkgs; [
          makeWrapper
        ];

        buildInputs = with pkgs; [
          wayland
          libxkbcommon
          vulkan-loader
        ];

        postFixup = ''
          wrapProgram $out/bin/keal --suffix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath finalAttrs.buildInputs}
        '';

        cargoHash = "sha256-N2JU24Mv3ecFrCjo9oKCcFMk2zSDabz2ptDFmnkX8YA=";
      });
    };
}
