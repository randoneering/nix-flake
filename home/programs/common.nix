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

    # python
    ruff
    uv

    # nix dev
    niv

    # IDE/Database Manager
    mongosh
    postgresql
    mysql80
    pgformatter

    # IaC
    docker-compose
    opentofu

    # Configuration Management
    ansible

    # Steam?
    glibc
  ];

}
