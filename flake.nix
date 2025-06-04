{
  description = "Randoneering Multi-System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      nix-lattitude = let
        username = "randoneering"
        specialArgs = {inherit username;};
        in
            nixpkgs.lib.nixosSystem {
              inherit specialArgs
              system = "x86_64-linux";

              modules = [
                ./hosts/lattitude/configuration.nix
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

      nix-lemur = nixpkgs.lib.nixosSystem {
        system = "x86-64_linux";
        modules = [
          ./hosts/lemur/configuration.nix
        ];
      };

      db03 = nixpkgs-previous.lib.nixosSystem {
        system = "x86-64_linux";
        modules = [
          ./hosts/nix-db/configuration.nix
        ];
      };
    };
  };
}
