/*
 * Copyright 2022 Nahuel Gomez https://nahuelwexd.com
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

[GtkTemplate (ui = "/com/nahuelwexd/AboutWindowPoC/ui/AboutWindow.ui")]
abstract class Aw.AboutWindow : Adw.Window, Gtk.Buildable {
    [GtkChild]
    private unowned Gtk.Overlay _overlay;

    [GtkChild]
    private unowned Gtk.ScrolledWindow _scrolled_window;

    [GtkChild]
    private unowned Gtk.HeaderBar _headerbar;

    [GtkChild]
    private unowned Adw.PreferencesGroup _detail_group;

    [GtkChild]
    private unowned Adw.PreferencesGroup _support_group;

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

    public void add_child (Gtk.Builder builder, Object child, string? type) {
        if ((type == null && this._overlay != null || type == "detail") && child is Gtk.Widget) {
            this.add_detail_row ((Gtk.Widget) child);
            return;
        }

        if (type == "support" && child is Gtk.Widget) {
            this.add_support_row ((Gtk.Widget) child);
            return;
        }

        base.add_child (builder, child, type);
    }

    public void add_detail_row (Gtk.Widget details_row) {
        this._detail_group.add (details_row);
    }

    public void add_support_row (Gtk.Widget support_row) {
        this._support_group.add (support_row);
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
