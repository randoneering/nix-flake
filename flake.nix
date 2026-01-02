{
  description = "Randoneering Multi-System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs-update.url = "github:nix-community/nixpkgs-update";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-update,
    nixpkgs-unstable,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      nix-station = let
        username = "randoneering";
        hostname = "nix-station";
        overlay-unstable = final: prev: {
          unstable = import nixpkgs-unstable {
            system = prev.stdenv.hostPlatform.system;
            config.allowUnfree = true;
          };
        };
        specialArgs = {inherit username hostname;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";
          modules = [
            ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./hosts/${hostname}/default.nix
            ./users/${username}/nixos.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };

      nix-L16 = let
        username = "justin";
        hostname = "nix-l16";
        overlay-unstable = final: prev: {
          unstable = import nixpkgs-unstable {
            system = prev.stdenv.hostPlatform.system;
            config.allowUnfree = true;
          };
        };
        specialArgs = {
          inherit username hostname;
        };
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86-64_linux";
          modules = [
            ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./hosts/L16/default.nix
            ./users/${username}/nixos.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
      nix-lemur = let
        username = "justin";
        hostname = "nix-lemur";
        overlay-unstable = final: prev: {
          unstable = import nixpkgs-unstable {
            system = prev.stdenv.hostPlatform.system;
            config.allowUnfree = true;
          };
        };
        specialArgs = {inherit username hostname;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86-64_linux";
          modules = [
            ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./hosts/lemur/default.nix
            ./users/${username}/nixos.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
      nix-wks = let
        username = "justin";
        hostname = "nix-wks";
        overlay-unstable = final: prev: {
          unstable = import nixpkgs-unstable {
            system = prev.stdenv.hostPlatform.system;
            config.allowUnfree = true;
          };
        };
        specialArgs = {inherit username hostname;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86-64_linux";
          modules = [
            ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./hosts/wks/default.nix
            ./users/${username}/nixos.nix
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
