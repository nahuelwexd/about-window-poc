/*
 * Copyright 2022 Nahuel Gomez https://nahuelwexd.com
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

[GtkTemplate (ui = "/com/nahuelwexd/AboutWindowPoC/ui/AboutAppInfo.ui")]
sealed class Aw.AboutAppInfo : Gtk.Widget, Gtk.Buildable {
    [GtkChild]
    private unowned Gtk.Image _app_icon_image;

    [GtkChild]
    private unowned Gtk.Label _app_name_label;

    [GtkChild]
    private unowned Gtk.Label _devel_label;

    [GtkChild]
    private unowned Gtk.Label _author_name_label;

    [GtkChild]
    private unowned Gtk.Label _version_label;

    public string app_icon_name { get; set; default = "image-missing"; }
    public string app_name { get; set; default = Environment.get_application_name (); }
    public bool development { get; set; }
    public string? author_name { get; set; }
    public string? version { get; set; }

    public override void dispose () {
        this._app_icon_image?.unparent ();
        this._app_name_label?.unparent ();
        this._devel_label?.unparent ();
        this._author_name_label?.unparent ();
        this._version_label?.unparent ();

        base.dispose ();
    }

    [GtkCallback]
    private bool string_not_empty (string? str) {
        return str != null && str.length > 0;
    }
}
