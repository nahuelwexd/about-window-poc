project(
  'about-window-poc',
  'vala', 'c',

  default_options : [
    'warning_level=3',
    'b_ndebug=if-release',
  ],
  license         : 'GPL-3.0-or-later',
  meson_version   : '>=0.59',
  version         : '0.1.0',
)

gnome = import('gnome')

add_project_arguments(
  '-DG_LOG_DOMAIN="About-Window-PoC"',
  language : 'c',
)

add_project_arguments(
  '--enable-checking',
  '--nostdpkg',

  language : 'vala',
)

adwaita_dep = dependency('libadwaita-1', version : '>=1.1')

subdir('data')
subdir('src')
