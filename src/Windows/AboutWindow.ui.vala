/*
 * Copyright 2022 Nahuel Gomez https://nahuelwexd.com
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

[GtkTemplate (ui = "/com/nahuelwexd/AboutWindowPoC/ui/AboutWindow.ui")]
abstract class Aw.AboutWindow : Adw.Window {
    [GtkChild]
    private unowned Gtk.ScrolledWindow _scrolled_window;

    [GtkChild]
    private unowned Gtk.HeaderBar _headerbar;

    [GtkChild]
    private unowned Adw.PreferencesGroup _details_group;

    public string app_icon_name { get; set; default = "image-missing"; }
    public string app_name { get; set; default = Environment.get_application_name (); }
    public bool development { get; set; }
    public string? author_name { get; set; }
    public string? version { get; set; }

    construct {
        this._scrolled_window.vadjustment.value_changed.connect (this.on_scroll);
    }

    static construct {
        add_binding_action (Gdk.Key.Escape, 0, "window.close", null);
    }

    public void add_details_row (Gtk.Widget details_row) {
        this._details_group.add (details_row);
    }

    public override void dispose () {
        this._scrolled_window.vadjustment.value_changed.disconnect (this.on_scroll);
        base.dispose ();
    }

    private void on_scroll () {
        var is_hidden = this._headerbar.has_css_class ("hidden");

        if (!is_hidden && this._scrolled_window.vadjustment.value < 187.0) {
            this._headerbar.add_css_class ("hidden");
            return;
        }

        if (is_hidden && this._scrolled_window.vadjustment.value >= 187.0) {
            this._headerbar.remove_css_class ("hidden");
            return;
        }
    }

    [GtkCallback]
    private void update_devel_style () {
        var style_applied = this.has_css_class ("devel");

        if (!style_applied && development) {
            this.add_css_class ("devel");
            return;
        }

        if (style_applied && !development) {
            this.remove_css_class ("devel");
            return;
        }
    }
}
