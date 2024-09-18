{ lib, stdenv, bash, libtool, autoreconfHook, pkg-config, which
, fetchFromGitHub
, openssl
, zlib
, fuse3
}:
let
  version = "1.0";
  src = fetchFromGitHub {
    owner = "al3ks1s";
    repo = "AD1-tools";
    rev = "v${version}";
    hash = "sha256-KjQCqemMpGQkbqgws0ReQ0PjGesJyAucnorfqkCMxCc=";
  };
in
stdenv.mkDerivation {
  pname = "ad1-tools";
  inherit version src;

  enableParallelBuilding = true;

  nativeBuildInputs = [
    libtool
    autoreconfHook
  ];

  buildInputs = [
    openssl
    zlib
    fuse
  ];

  configureFlags = [
    "--with-openssl=${openssl}"
  ];

  preAutoreconf = ''
    libtoolize --force
  '';
}
