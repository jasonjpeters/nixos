{ env, ... }:
{
  time.timeZone = env.locale.timezone;

  console.keyMap = "us";

  i18n.defaultLocale = env.locale.charset;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = env.locale.charset;
    LC_IDENTIFICATION = env.locale.charset;
    LC_MEASUREMENT = env.locale.charset;
    LC_MONETARY = env.locale.charset;
    LC_NAME = env.locale.charset;
    LC_NUMERIC = env.locale.charset;
    LC_PAPER = env.locale.charset;
    LC_TELEPHONE = env.locale.charset;
    LC_TIME = env.locale.charset;
  };
}
