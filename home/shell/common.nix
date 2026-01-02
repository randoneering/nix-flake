{pkgs, ...}:
# nix tooling
{
  home.packages = with pkgs.unstable; [
    alejandra
    nixpkgs-vet
    nixpkgs-fmt
    nixpkgs-lint
    nixpkgs-pytools

  ];
}
