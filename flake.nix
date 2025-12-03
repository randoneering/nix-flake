{
  description = "Randoneering Multi-System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    unstable-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs-update.url = "github:nix-community/nixpkgs-update";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flox-nixpkgs.url = "github:flox/nixpkgs/stable";
    flox.url = "github:flox/flox";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-update,
    unstable-nixpkgs,
    home-manager,
    flox,
    flox-nixpkgs,
    ...
  }: {
    nixosConfigurations = {
      nix-lemur = let
        username = "justin";
        hostname = "nix-lemur";
        specialArgs = {inherit username hostname;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86-64_linux";
          modules = [
            ./hosts/lemur/default.nix
            ./users/${username}/nixos.nix
            inputs.flox.nixosModules.flox
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
    };
  };
}
