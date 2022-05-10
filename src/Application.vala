/*
 * Copyright 2022 Nahuel Gomez https://nahuelwexd.com
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

sealed class Aw.Application : Adw.Application {
    construct {
        this.application_id = "com.nahuelwexd.AboutWindowPoC";
    }

    public static int main (string[] args) {
        var app = new Application ();
        return app.run (args);
    }

    public override void activate () {
        this.active_window?.present ();
    }

    public override void startup () {
        base.startup ();

        /* we add the window to the app manually, so we can avoid
         * adding parameters to the constructor of the about window
         * that will not be needed when developing a real app. */

        this.add_window (new AboutWindow ());
    }
}
