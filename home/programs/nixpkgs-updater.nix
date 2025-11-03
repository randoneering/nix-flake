{nixpkgs-updater, ...}: {
  home.packages = with nixpkgs-updater;[
    nixpkgs-updater
  ];
}
