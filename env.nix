{
    # Host
    host = "vm";
    hostname = "nixos";
    domain = "dorkside.dev";

    # Locale
    locale = {
      timezone = "America/Vancouver";
      charset = "en_US.UTF-8";
    };

    # User
    username = "jase";
    fullname = "Jase";

    # Git configuration
    git = {
        user = "Jase";
        email = "jasonjpeters@gmail.com";
    };

    # Feature toggles
    flags = {

    };
}
