{ lib, fetchFromGitHub, buildGoModule }:
buildGoModule rec {
  pname = "vmagent";
  version = "1.93.5";

  src = fetchFromGitHub {
    owner = "VictoriaMetrics";
    repo = "VictoriaMetrics";
    rev = "v${version}";
    sha256 = "sha256-AC3tQAgGHKl86MakfSWnFMX1Lr5r7RwZfomXtp5/oBs=";
  };

  ldflags = [ "-s" "-w" "-X github.com/VictoriaMetrics/VictoriaMetrics/lib/buildinfo.Version=${version}" ];

  vendorHash = null;

  subPackages = [ "app/vmagent" ];

  meta = with lib; {
    homepage = "https://github.com/VictoriaMetrics/VictoriaMetrics/tree/master/app/vmagent";
    description = "VictoriaMetrics metrics scraper";
    license = licenses.asl20;
    platforms = platforms.linux;
    maintainers = with maintainers; [ nullx76 ];
  };
}
