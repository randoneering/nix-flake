{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip

    # utils
    btop
    dpkg
    cargo
    rustc
    ruff
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
    cider


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


    # Security
    syft
    grype
    proton-pass
    bitwarden
  ];
}
