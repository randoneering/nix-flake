{config, ...}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      # version: 1.0.0

      add_newline = true
      continuation_prompt = "[▸▹ ](dimmed white)"

      format = """($nix_shell$container$fill$git_metrics\n)$cmd_duration\
      $hostname\
      $localip\
      $shlvl\
      $shell\
      $env_var\
      $jobs\
      $sudo\
      $username\
      $character"""

      right_format = """
      $kubernetes\
      $directory\
      $fossil_branch\
      $git_branch\
      $git_commit\
      $git_state\
      $git_status\
      $docker_context\
      $package\
      $golang\
      $java\
      $nodejs\
      $python\
      $ruby\
      $rust\
      $terraform\
      $memory_usage\
      $aws\
      $gcloud\
      $openstack\
      $azure\
      $custom\
      $status\
      $os\
      $battery\
      $time"""

      [fill]
      symbol = ' '

      [character]
      format = "$symbol "
      success_symbol = "[◎](bold italic bright-yellow)"
      error_symbol = "[○](italic purple)"
      vimcmd_symbol = "[■](italic dimmed green)"
      # not supported in zsh
      vimcmd_replace_one_symbol = "◌"
      vimcmd_replace_symbol = "□"
      vimcmd_visual_symbol = "▼"

      [env_var.VIMSHELL]
      format = "[$env_value]($style)"
      style = 'green italic'

      [sudo]
      format = "[$symbol]($style)"
      style = "bold italic bright-purple"
      symbol = "⋈┈"
      disabled = false

      [username]
      style_user = "bright-yellow bold italic"
      style_root = "purple bold italic"
      format = "[⭘ $user]($style) "
      disabled = false
      show_always = false

      [directory]
      home_symbol = "⌂"
      truncation_length = 2
      truncation_symbol = "□ "
      read_only = " ◈"
      use_os_path_sep = true
      style = "italic blue"
      format = '[$path]($style)[$read_only]($read_only_style)'
      repo_root_style = 'bold blue'
      repo_root_format = '[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) [△](bold bright-blue)'

      [cmd_duration]
      format = "[◄ $duration ](italic white)"

      [jobs]
      format = "[$symbol$number]($style) "
      style = "white"
      symbol = "[▶](blue italic)"

      [localip]
      ssh_only = true
      format = " ◯[$localipv4](bold magenta)"
      disabled = false

      [time]
      disabled = false
      format = "[ $time]($style)"
      time_format = "%R"
      utc_time_offset = "local"
      style = "italic dimmed white"

      [battery]
      format = "[ $percentage $symbol]($style)"
      full_symbol = "█"
      charging_symbol = "[↑](italic bold green)"
      discharging_symbol = "↓"
      unknown_symbol = "░"
      empty_symbol = "▃"

      [[battery.display]]
      threshold = 20
      style = "italic bold red"

      [[battery.display]]
      threshold = 60
      style = "italic dimmed bright-purple"

      [[battery.display]]
      threshold = 70
      style = "italic dimmed yellow"

      [git_branch]
      format = " [$branch(:$remote_branch)]($style)"
      symbol = "[△](bold italic bright-blue)"
      style = "italic bright-blue"
      truncation_symbol = "⋯"
      truncation_length = 11
      ignore_branches = ["main", "master"]
      only_attached = true

      [git_metrics]
      format = '([▴$added]($added_style))([▿$deleted]($deleted_style))'
      added_style = 'italic dimmed green'
      deleted_style = 'italic dimmed red'
      ignore_submodules = true
      disabled = false

      [git_status]
      style = "bold italic bright-blue"
      format = "([⎪$ahead_behind$staged$modified$untracked$renamed$deleted$conflicted$stashed⎥]($style))"
      conflicted = "[◪◦](italic bright-magenta)"
      ahead = "[▴│[${count}](bold white)│](italic green)"
      behind = "[▿│[${count}](bold white)│](italic red)"
      diverged = "[◇ ▴┤[${ahead_count}](regular white)│▿┤[${behind_count}](regular white)│](italic bright-magenta)"
      untracked = "[◌◦](italic bright-yellow)"
      stashed = "[◃◈](italic white)"
      modified = "[●◦](italic yellow)"
      staged = "[▪┤[$count](bold white)│](italic bright-cyan)"
      renamed = "[◎◦](italic bright-blue)"
      deleted = "[✕](italic red)"

      [nodejs]
      format = " [node](italic) [◫ ($version)](bold bright-green)"
      version_format = "${raw}"
      detect_files = ["package-lock.json", "yarn.lock"]
      detect_folders = ["node_modules"]
      detect_extensions = []

      [python]
      format = " [py](italic) [${symbol}${version}]($style)"
      symbol = "[⌉](bold bright-blue)⌊ "
      version_format = "${raw}"
      style = "bold bright-yellow"

      [ruby]
      format = " [rb](italic) [${symbol}${version}]($style)"
      symbol = "◆ "
      version_format = "${raw}"
      style = "bold red"

      [rust]
      format = " [rs](italic) [$symbol$version]($style)"
      symbol = "⊃ "
      version_format = "${raw}"
      style = "bold red"

      [package]
      format = " [pkg](italic dimmed) [$symbol$version]($style)"
      version_format = "${raw}"
      symbol = "◨ "
      style = "dimmed yellow italic bold"

      [aws]
      disabled = true
      format = " [aws](italic) [$symbol $profile $region]($style)"
      style = "bold blue"
      symbol = "▲ "

      [c]
      symbol = "ℂ "
      format = " [$symbol($version(-$name))]($style)"

      [docker_context]
      symbol = "◧ "
      format = " docker [$symbol$context]($style)"

      [golang]
      symbol = "∩ "
      format = " go [$symbol($version )]($style)"

      [java]
      symbol = "∪ "
      format = " java [${symbol}(${version} )]($style)"

      [memory_usage]
      symbol = "▪▫▪ "
      format = " mem [${ram}( ${swap})]($style)"

      [nix_shell]
      style = 'bold italic dimmed blue'
      symbol = '✶'
      format = '[$symbol nix⎪$state⎪]($style) [$name](italic dimmed white)'
      impure_msg = '[⌽](bold dimmed red)'
      pure_msg = '[⌾](bold dimmed green)'
      unknown_msg = '[◌](bold dimmed ellow)'

      [spack]
      symbol = "◇ "
      format = " spack [$symbol$environment]($style)"
    };
  };
}
