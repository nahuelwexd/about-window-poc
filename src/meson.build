sources = [
  'Windows/AboutWindow.ui.vala',
  'Windows/AboutWindowDemo.ui.vala',

  'Application.vala',
]

resources += gnome.compile_resources(
  'about-window-poc-ui-resources',
  'about-window-poc-ui-resources.xml',
)

deps = [
  adwaita_dep,
]

executable(
  meson.project_name(),
  sources, resources,

  dependencies : deps,
  install      : true,
)
