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

    # rust
    cargo
    rustc
    ruff

    # python
    ruff
    uv

    # productivity
    obsidian
    planify

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
