{den, ...}: {
  den.aspects.mikko5 = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "fish")
    ];

    # user.extraGroups = [
    # "gamemode" move to gaming aspect, when steam and gamemode programs enabled
    # "docker" move to heaper aspect
    # ];
  };
}
