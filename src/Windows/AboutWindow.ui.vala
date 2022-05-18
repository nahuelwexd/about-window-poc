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

    public override void dispose () {
        this._scrolled_window.vadjustment.value_changed.disconnect (this.on_scroll);
        base.dispose ();
    }

    private void on_scroll () {
        if (this._scrolled_window.vadjustment.value < 187.0) {
            this._headerbar.add_css_class ("hidden");
            return;
        }

        this._headerbar.remove_css_class ("hidden");
    }
}
