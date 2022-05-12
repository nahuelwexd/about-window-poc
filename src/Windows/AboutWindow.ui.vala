/*
 * Copyright 2022 Nahuel Gomez https://nahuelwexd.com
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

[GtkTemplate (ui = "/com/nahuelwexd/AboutWindowPoC/ui/AboutWindow.ui")]
abstract class Aw.AboutWindow : Adw.Window {
    public string app_icon_name { get; set; default = "image-missing"; }
    public string app_name { get; set; default = Environment.get_application_name (); }
    public bool development { get; set; }
    public string? author_name { get; set; }
    public string? description { get; set; }
    public string? version { get; set; }
    public Gtk.Widget? details { get; set; }
    public Gtk.Widget? credits { get; set; }
    public Gtk.License license_type { get; set; }
    public string? license { get; set; }
    public string? copyright { get; set; }
}
