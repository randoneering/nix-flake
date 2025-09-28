{
  pkgs,
  lib,
  username,
  ...
}:{
  # systemd.services.ollama.serviceConfig = {
  #   Environment = [ "OLLAMA_HOST=10.10.1.197:11434" ];
  # };
  # Ollama Setup
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    loadModels = [ "llama3.2:3b" "deepseek-r1:1.5b" "gemma3:12b" "qwen3:8b" "qwen3:14b"];
    openFirewall = true;
    host = "localhost"; # Make Ollama accesible outside of localhost
  };
  # Open-Webui setup
  services.open-webui = {
    enable = true;
    openFirewall = true;
    host = "localhost";
    environment = {
      ANONYMIZED_TELEMETRY = "False";
      DO_NOT_TRACK = "True";
      SCARF_NO_ANALYTICS = "True";
      OLLAMA_API_BASE_URL = "http://localhost:11434/api";
      OLLAMA_BASE_URL = "http://localhost:11434";
    };
  };

}
