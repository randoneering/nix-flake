{pkgs, ...}: {

  home.packages = with pkgs; [
    # archives
    zip

    # utils
    btop
    dpkg
    ripgrep
    nfs-utils
    git
    wget
    popsicle
    dconf
    freshfetch
    gimp3

    # rust
    cargo
    rustc

    # python
    ruff
    uv

    # nix dev
    niv

    # productivity
    obsidian
    planify
    atuin-desktop

    # IDE/Database Manager
    zed-editor
    dbeaver-bin
    mongosh
    postgresql
    mysql80
    pgformatter
    claude-code

    # IaC
    docker-compose
    opentofu

    # Configuration Management
    ansible
    ##ansible-lint failing to build

    # Security
    syft
    grype
    proton-pass
    proton-authenticator
    bitwarden-desktop
    protonvpn-gui
    protonmail-desktop



  ];
}
