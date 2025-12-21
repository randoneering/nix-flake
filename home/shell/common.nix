{pkgs, ...}:
# nix tooling
{
  home.packages = with pkgs; [
    alejandra
    nixpkgs-vet
    nixpkgs-fmt
    nixpkgs-lint
    nixpkgs-pytools

  ];
}
