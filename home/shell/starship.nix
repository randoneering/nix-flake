{config, ...}:
{
  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;
  xdg.configFile."starship.toml".text = ''
    "$schema" = "https://starship.rs/config-schema.json"
    # version: 1.0.0

    add_newline = true
    format = """$all"""
  '';
}
