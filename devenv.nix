{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  # https://devenv.sh/basics/
  overlays = [
    (final: prev: {
      blowfish-tools = final.callPackage ./nix/blowfish-tools.nix { };
    })
  ];

  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.hugo
    pkgs.blowfish-tools
    #pkgs.tailwindcss_4
  ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;
  languages.go.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";
  processes = {
    hugo-serve = {
      exec = "hugo serve -D";
    };
  };

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts = {
    update.exec = ''
      echo "Updating..."
      git pull
    '';
  };

  enterShell = ''
    git fetch
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;
  git-hooks.hooks = {
    # All text
    check-symlinks.enable = true; # finds symlinks that are broken
    trim-trailing-whitespace.enable = true; # removes trailing whitespace
    # Git
    check-added-large-files.enable = true; # finds large files that are added
    check-merge-conflicts.enable = true; # finds merge conflicts that are unresolved
    # GitHub
    actionlint.enable = true;
    # Language specific
    check-toml.enable = true;
    nixfmt-rfc-style.enable = true;
    #gofmt.enable = true;
    #golines.enable = true;
    #govet.enable = true;
    #check-json.enable = true;
    #check-yaml.enable = true;
    #chktex.enable = true;
    #pretty-format-json.enable = true;
  };

  # See full reference at https://devenv.sh/reference/options/
}
