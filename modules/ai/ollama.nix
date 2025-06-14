{
  pkgs,
  ...
}:{
  services.ollama = {
  enable = true;
  loadModels = [ "llama3.2:3b" "deepseek-r1:1.5b" "qwen3:8b"];
};
}
