{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip

    # utils
    btop
    dpkg
    cargo
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
    # Accounting

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
