{ buildGoModule
, fetchFromGitHub
, lib
}:

buildGoModule rec {
  pname = "oauth2c";
  version = "1.12.0";

  src = fetchFromGitHub {
    owner = "cloudentity";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-7WZJdB4D1UnveAgf8+aZlE/4+d0rUIPIYqG5k993nk4=";
  };

  vendorHash = "sha256-euEmslrSbXPVDNZkIguq+ukt74Um4H0+lIXEyCBorjE=";

  doCheck = false; # tests want to talk to oauth2c.us.authz.cloudentity.io

  meta = with lib; {
    homepage = "https://github.com/cloudentity/oauth2c";
    description = "User-friendly OAuth2 CLI";
    longDescription = ''
      oauth2c is a command-line tool for interacting with OAuth 2.0
      authorization servers. Its goal is to make it easy to fetch access tokens
      using any grant type or client authentication method. It is compliant with
      almost all basic and advanced OAuth 2.0, OIDC, OIDF FAPI and JWT profiles.
    '';
    license = licenses.asl20;
    maintainers = [ maintainers.flokli ];
    platforms = platforms.darwin ++ platforms.linux;
  };
}
