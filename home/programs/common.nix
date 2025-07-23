{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip

    # utils
    btop
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
    invoiceplane


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
