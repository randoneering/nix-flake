{
  description = "Randoneering Multi-System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-previous.url ="github:nixos/nixpkgs/nixos-24.11";
    unstable-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";  };
  };
  outputs = {
    self,
    nixpkgs,
    nixpkgs-previous,
    home-manager,
    ...
    }@ inputs: let
    unstable = import inputs.unstable-nixpkgs {
      config = {allowUnfree = true;};
      overlays = [];
    };
  in {
    nixosConfigurations = {
      nix-lattitude = nixpkgs.lib.nixosSystem {
        system = "x86-64_linux";
        modules = [
          ./hosts/lattitude/configuration.nix
          {
            networking.hostName = "nix-lattitude";
          }
        ];
      };

      nix-lemur = nixpkgs.lib.nixosSystem {
        system = "x86-64_linux";
        modules = [

          ./hosts/lemur/configuration.nix
          {
            networking.hostName = "nix-lemur";
          }
        ];
      };

      db03 = nixpkgs-previous.lib.nixosSystem {
        system = "x86-64_linux";
        modules = [
          ./hosts/nix-db/configuration.nix
          {
            networking.hostName = "nix-db";
          }
        ];
      };
    };
  };
}
