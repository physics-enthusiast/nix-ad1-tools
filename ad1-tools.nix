{ lib, stdenv, bash, autoreconfHook, pkg-config, which
, fetchFromGitHub
}: 
let
  version = "1.0";
  src = fetchFromGitHub {
    owner = "al3ks1s";
    repo = "AD1-tools";
    rev = "v${version}";
    hash = lib.fakeHash;
  };
in
stdenv.mkDerivation {
  pname = "ad1-tools";
  inherit version src;

  enableParallelBuilding = true;

  nativeBuildInputs = [
  ];
  buildInputs = [
  ];

  preConfigure = ''
    patchShebangs --build ./autogen.sh
    ./autogen.sh
  '';
}
