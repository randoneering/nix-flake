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


    # productivity
    joplin-desktop
    super-productivity

    # IDE/Database Manager
    zed-editor
    dbeaver-bin

    # IaC
    docker-compose
    opentofu

    # Configuration Management
    ansible
    ansible-lint

    # Security
    syft
    grype
    bitwarden
  ];
}
