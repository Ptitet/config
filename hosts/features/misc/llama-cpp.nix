{ pkgs, ... }: {
  services.llama-cpp = {
    enable = true;
    settings.port = 2465;
  };

  environment.systemPackages = with pkgs; [
    llama-cpp-vulkan
    llmfit
  ];
}
