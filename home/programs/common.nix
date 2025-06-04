{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip

    # utils
    btop
    flameshot
    remmina

    # productivity
    joplin-desktop
    super-productivity
    slack

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
