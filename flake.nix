{
  description = "Randoneering Multi-System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flox-nixpkgs.url = "github:flox/nixpkgs/stable";
    flox.url = "github:flox/flox";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    flox,
    flox-nixpkgs,
    ...
  }: {
    nixosConfigurations = {
      nix-lattitude = let
        username = "randoneering";
        specialArgs = {inherit username;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            ./hosts/lattitude/default.nix
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

      nix-L16 =
      let
        username = "justin";
        specialArgs = {inherit username;};
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86-64_linux";
        modules = [
          ./hosts/L16/default.nix
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
      nix-lemur =
      let
        username = "justin";
        specialArgs = {inherit username;};
      in nixpkgs.lib.nixosSystem {
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
      nix-wks =
      let
        username = "justin";
        specialArgs = {inherit username;};
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86-64_linux";
        modules = [
          ./hosts/wks/default.nix
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
      db03 = nixpkgs.lib.nixosSystem {
        system = "x86-64_linux";
        modules = [
          ./hosts/nix-db/configuration.nix
        ];
      };
    };
  };
}
