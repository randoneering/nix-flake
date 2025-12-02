{
  config,
  lib,
  ...
}: {
  programs = {
    starship = {
      enable = true;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableZshIntegration = config.programs.zsh.enable;
      settings = {
        add_newline = false;
        continuation_prompt = "'▶▶";
        command_timeout = 1000;
        format = lib.concatStrings [
          " |"
          "$hostname"
          "$directory"
          "$git_branch$git_commit$git_state $git_status"
          "⋙  "];
        right_format = lib.concatStrings [
        "$python"
        "$rust"
        "$terraform"
        "$memory_usage"
        "$aws"
        "$custom"
        "$status"
        "$os"
        "$time"];
        directory = {
            disabled = false;
            format = "[$path](bold fg:#458588)";
            truncate_to_repo = false;
        };
        git_branch = {
        format = " [  $branch](fg:#b16286)";
        };
        git_status = {
        ahead = "⇡$count";
        behind = "⇣$count";
        diverged = "⇕⇡$ahead_count⇣$behind_count";
        format = "[[( $all_status$ahead_behind )](fg:#d79921)]($style)";
        style = "#394260";
        };
        time = {
        disabled = false;
        format = "[[$time](fg:#f42c3e )]($style)";
        time_format = "%R";
        };
        python = {
        format = "[$symbol]($virtualenv) $version]($style)";
        style = "#fabd2f";
        symbol = "[ ](bold bright-blue)";
        version_format = "$raw";
        };
        rust = {
        style = "#f42c3e";
        format = " rs(italic) $symbol($style)";
        symbol = " ";
        };
        hostname = {
        format = "$hostname ";
        };
        aws = {
        format = " [aws](italic) [$symbol $profile $region]($style)";
        style = "#458588";
        symbol = " ";
        };

        memory_usage = {
        style = "#689d6a";
        format = " mem [$ram( $swap)]($style)";
        symbol = "▪▫▪ ";
        };

        nix_shell = {
        format = "[$symbol nix⎪$state⎪]($style) [$name](italic dimmed white)";
        impure_msg = "[⌽](bold dimmed red)";
        pure_msg = "[⌾](bold dimmed green)";
        style = "#99c6ca";
        symbol = " ";
        unknown_msg = "[◌](bold dimmed yellow)";
        };
        kubernetes = {
        style = "#7ec16e";
        format = " [kubernetes](italic) [$symbol]($style)";
        symbol = " ";
        };
        helm = {
        style = "#fabd2f";
        format = " [helm](italic) [$symbol]($style)";
        symbol = "helm ";
        };
        terraform = {
        style = "#7ec16e";
        format = " [terraform](italic) [$symbol]($style)";
        symbol = "terraform ";
        };
        };
    };
  };
}
