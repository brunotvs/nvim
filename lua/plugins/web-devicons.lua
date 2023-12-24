return {
  'nvim-tree/nvim-web-devicons',
  opts = {
    strict = true,
    override_by_extension = {
      ["module.ts"] = { icon = "", color = "#e53935", name = "Angular" },
      ["component.ts"] = { icon = "", color = "#0288d1", name = "AngularComponent" },
      ["directive.ts"] = { icon = "", color = "#ab47bc", name = "AngularDirective" },
      ["guard.ts"] = { icon = "", color = "#43a047", name = "AngularGuard" },
      ["pipe.ts"] = { icon = "", color = "#00897b", name = "AngularPipe" },
      ["resolver.ts"] = { icon = "", color = "#43a047", name = "AngularResolver" },
      ["service.ts"] = { icon = "", color = "#ffca28", name = "AngularService" },
    },
    override_by_filename = {
      ["package.json"] = {
        icon = "󰎙",
        color = "#e8274b",
        name = "PackageJson",
      },
      ["package-lock.json"] = {
        icon = "󰎙",
        color = "#7a0d21",
        name = "PackageLockJson",
      }
    }
  }
}
