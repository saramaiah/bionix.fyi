{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
}:

buildNpmPackage rec {
  pname = "blowfish-tools";
  version = "1.9.0";

  src = fetchFromGitHub {
    owner = "nunocoracao";
    repo = "blowfish-tools";
    rev = "v${version}";
    hash = "sha256-KNNY2tws4KfsyDQ2gsuasOFamxF3YQY4zeqHffUgj3o=";
  };

  npmDepsHash = "sha256-PvddV/HuPgHUpja2nR59bIUKllPVtKDoy8kM9JYL98M=";

  # Dont build
  dontNpmBuild = true;

  #NODE_OPTIONS = "--openssl-legacy-provider";

  meta = {
    description = "CLI to initialize a Blowfish project ";
    homepage = "https://blowfish.page";
    license = lib.licenses.mit;
    mainProgram = "blowfish-tools";
    maintainers = [ ];
  };
}
