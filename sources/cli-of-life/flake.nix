{
  description = "Play Conway's Game Of Life in your terminal!";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.buildGoModule (finalAttrs: {
        pname = "cli-of-life";
        version = "0.4.3";

        src = pkgs.fetchFromGitHub {
          owner = "gabe565";
          repo = "cli-of-life";
          tag = "v${finalAttrs.version}";
          hash = "sha256-vMr5eF6FaY4gep3M2IlwhJ6eNNT88UyhDfGGFEDBR+4=";
        };

        vendorHash = "sha256-Qec8EhpRr0d56nehSHSKRU+P7MItZCvFj3xeyJSkzzE=";
      });
    };
}
