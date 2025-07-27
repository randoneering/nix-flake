{config, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set OLLAMA_HOST llm01
      eval ssh-agent
    '';
  };
}
