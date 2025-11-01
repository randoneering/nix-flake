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
                #format = lib.concatStrings [
        format = lib.concatStrings [
          ""
          "$directory"
          "$git_branch$git_commit$git_state $git_status"
          "$character"];
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
            format = "[$path](bold fg:#8be9fd)";
            truncate_to_repo = false;
        };
        git_branch = {
        format = " [  $branch](fg:#9198a1)";
        };
        git_status = {
        ahead = "⇡$count";
        behind = "⇣$count";
        diverged = "⇕⇡$ahead_count⇣$behind_count";
        format = "[[( $all_status$ahead_behind )](fg:#769ff0)]($style)";
        style = "bg:#394260";
        };
        time = {
        disabled = false;
        format = "[[  $time ](fg:#a0a9cb )]($style)";
        time_format = "%R";
        };
        python = {
        format = "[$symbol]($virtualenv) $version]($style)";
        style = "bold bright-yellow";
        symbol = "[ ](bold bright-blue)";
        version_format = "$raw";
        };
        rust = {
        style = "bold bright-red";
        format = " rs(italic) $symbol($style)";
        symbol = " ";
        };
        aws = {
        format = " [aws](italic) [$symbol $profile $region]($style)";
        style = "bold blue";
        symbol = " ";
        };

        memory_usage = {
        style = "bold bright-cyan";
        format = " mem [$ram( $swap)]($style)";
        symbol = "▪▫▪ ";
        };

        nix_shell = {
        format = "[$symbol nix⎪$state⎪]($style) [$name](italic dimmed white)";
        impure_msg = "[⌽](bold dimmed red)";
        pure_msg = "[⌾](bold dimmed green)";
        style = "bold italic dimmed blue";
        symbol = " ";
        unknown_msg = "[◌](bold dimmed ellow)";
        };
        kubernetes = {
        style = "bold bright-cyan";
        format = " [kubernetes](italic) [$symbol]($style)";
        symbol = " ";
        };
        helm = {
        style = "bold bright-yellow";
        format = " [helm](italic) [$symbol]($style)";
        symbol = "helm ";
        };
        terraform = {
        style = "bold bright-cyan";
        format = " [terraform](italic) [$symbol]($style)";
        symbol = "terraform ";
        };
        };
    };
  };
}
