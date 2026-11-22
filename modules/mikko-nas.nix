{den, ...}: {
  den.aspects.mikko-nas = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "fish")
    ];
  };
}
