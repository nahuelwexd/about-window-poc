scalable_dir = 'scalable/apps'
install_data(
  scalable_dir / application_id + '.svg',
  install_dir : datadir / 'icons/hicolor' / scalable_dir,
)

symbolic_dir = 'symbolic/apps'
install_data(
  symbolic_dir / application_id + '-symbolic.svg',
  install_dir : datadir / 'icons/hicolor' / symbolic_dir,
)

resources += gnome.compile_resources(
  'about-window-poc-icon-resources',
  'about-window-poc-icon-resources.xml',
)
