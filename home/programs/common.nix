{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip

    # utils
    btop
    dpkg
    cargo
    rustc
    flameshot
    remmina
    ripgrep
    nfs-utils
    git
    wget
    popsicle
    dconf
    freshfetch
    gpufetch
    oterm
    # media
    steam-unwrapped
    cider-2

    # productivity
    obsidian
    super-productivity


    # IDE/Database Manager
    zed-editor
    dbeaver-bin
    mongosh
    postgresql
    mysql80

    # IaC
    docker-compose
    opentofu

    # Configuration Management
    ansible
    ansible-lint
    # Gaming
    steam
    # Security
    syft
    grype
    proton-pass
    bitwarden
  ];
}
