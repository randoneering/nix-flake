# Randoneering's Multi-System Nix Flake

Here is my personal nix flake configuration for managing multiple systems with reproducible, declarative configurations.

## Overview

This repository contains my Nix flake that provides system configurations, modules, and home manager related fun. It uses the power of nix flakes to ensure reproducible builds and easy system management. The is something I truly enjoy working in, and like some of you, find myself crafting my flake more than working on my other projects.....

## Features

- **Multi-system support**: Configurations for different machines and architectures
- **Reproducible environments**: Locked dependencies ensure consistent builds
- **Modular configuration**: Reusable modules and shared configurations
- **Home Manager integration**: User-specific configurations alongside system configs


### Enabling Flakes

If you haven't enabled flakes yet, add the following to your Nix configuration:

```nix
# Add this in your configuration.nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

```bash
# Run after updating your configuration.nix
sudo nixos-rebuild switch
```

## Usage

### Building System Configurations

```bash
# Build a specific system configuration
sudo nixos-rebuild switch --flake /path/to/this/flake#hostname
```


## Repository Structure

```
.
├── home/                  # Home Manager configurations
│   ├── programs/          # Nix Packages and configurations
│   └── shell/             # Shell related configurations
│   └── utils/             # Utility based packages/tooling
├── hosts/                 # System-specific configurations
│   ├── hostname1/
│   └── hostname2/
├── modules/               # Reusable NixOS modules
└── users/                # User configurations
├── flake.nix              # Main flake configuration
├── flake.lock             # Locked dependency versions
```

## Adding a New System

1. Create a new directory under `hosts/` with your hostname
2. Add the system configuration files
3. Reference the new system in `flake.nix`
4. Build and switch to the new configuration


```nix
nixosConfigurations = {
  new-hostname = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./hosts/new-hostname/configuration.nix
      # Add other modules as needed
    ];
  };
};
```

## Configuration Management

### System Updates

```bash
# Update system packages
nix flake update

# Update and upgrade
nix flake update && sudo nixos-rebuild switch --flake .#hostname
```


## Troubleshooting

### Common Issues

**Flake not recognized:**
- Ensure flakes are enabled in your Nix configuration
- Use `nix --extra-experimental-features "nix-command flakes"` for one-time usage

**Build failures:**
- Check flake.lock for dependency conflicts
- Try `nix flake update` to resolve version conflicts
- Use `nix build --show-trace` for detailed error information

**Permission issues:**
- Ensure proper ownership of configuration files
- Use `sudo` for system-level operations

### Debugging

```bash
# Check flake evaluation
nix flake check

# Show flake outputs
nix flake show

# Debug build with traces
sudo nixos-rebuild switch --flake /path/to/this/flake#hostname --show-trace --print-build-logs
```

## Resources

- [Nix Flakes Documentation](https://nixos.wiki/wiki/Flakes)
- [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/)
- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Nix Package Search](https://search.nixos.org/)
