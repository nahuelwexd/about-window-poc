about_window_poc_sources = [
  'Windows/AboutWindowDemo.ui.vala',

  'Application.vala',
]

about_window_poc_sources += gnome.compile_resources(
  'about-window-poc-ui-resources',
  'about-window-poc-ui-resources.xml',
)

about_window_poc_deps = [
  adwaita_dep,
]

executable(
  meson.project_name(),
  about_window_poc_sources,

  dependencies : about_window_poc_deps,
  install      : true,
)
