{ env, ... }:
{
  programs.git = {
    enable = true;
    userName = "${env.git.user}";
    userEmail = "${env.git.email}";

    extraConfig = {
      push.default = "simple";
      credential.helper = "cache --timeout=7200";
      init.defaultBranch = "main";
      log.decorate = "full";
      log.date = "iso";
      merge.conflictStyle = "diff3";
    };

    aliases = {
      br = "branch --sort=-committerdate";
      co = "checkout";
      df = "diff";
      com = "commit -a";
      gs = "stash";
      gp = "pull";
      lg = "log --graph --pretty=format:'%Cred%h%Creset - %C(yellow)%d%Creset %s %C(green)(%cr)%C(bold blue) <%an>%Creset' --abbrev-commit";
      st = "status";
    };
  };
}
