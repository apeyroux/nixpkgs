{ stdenv, fetchFromGitHub, buildGoPackage }:

buildGoPackage rec{
  name = "scaleway-cli-${version}";
  version = "1.15";

  goPackagePath = "github.com/scaleway/scaleway-cli";

  src = fetchFromGitHub {
    owner = "scaleway";
    repo = "scaleway-cli";
    rev = "v${version}";
    sha256 = "1jm646skcncjyk81x0hxvr2x8jxysmzvhrpgqd48nrl0isxwsmmp";
  };

  meta = with stdenv.lib; {
    description = "Interact with Scaleway API from the command line";
    homepage = https://github.com/scaleway/scaleway-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ nickhu ];
    platforms = platforms.all;
  };
}
