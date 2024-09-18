{ stdenv, libtool, autoreconfHook, pkg-config
, fetchFromGitHub
, openssl
, zlib
, fuse
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
  hardeningDisable = [ "fortify" ];

  nativeBuildInputs = [
    libtool
    autoreconfHook
    pkg-config
  ];

  buildInputs = [
    openssl
    zlib
    fuse
  ];

  preAutoreconf = ''
    libtoolize --force
  '';
}
