# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Sub-meta package for the core applications integrated with GNOME 3"
HOMEPAGE="http://www.gnome.org/"
LICENSE="metapackage"
SLOT="3.0"
IUSE="+bluetooth +cdr cups +networkmanager"

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86"

# Note to developers:
# This is a wrapper for the core apps tightly integrated with GNOME 3
# gtk-engines:2 is still around because it's needed for gtk2 apps
RDEPEND="
	>=gnome-base/gnome-core-libs-${PV}[cups?]

	>=gnome-base/gnome-session-${PV}
	>=gnome-base/gnome-settings-daemon-${PV}[cups?]
	>=gnome-base/gnome-control-center-${PV}[cups?]

	>=app-crypt/gcr-${PV}
	>=gnome-base/nautilus-${PV}
	>=gnome-base/gnome-keyring-${PV}

	>=app-editors/gedit-${PV}
	>=app-text/evince-${PV}
	>=media-gfx/eog-${PV}
	>=x11-terms/gnome-terminal-${PV}

	>=x11-themes/gtk-engines-2.20.2:2
	>=x11-themes/gnome-icon-theme-${PV}
	>=x11-themes/gnome-icon-theme-symbolic-${PV}
	>=x11-themes/gnome-themes-standard-${PV}

	cdr? ( >=app-cdr/brasero-3.8.0 )
	bluetooth? ( >=net-wireless/gnome-bluetooth-${PV} )
	networkmanager? ( >=gnome-extra/nm-applet-0.9.8.0[bluetooth?] )

	!gnome-base/gnome-applets
"
# Temporarily removed from RDEPEND. Put them back once version bumped to 3.10
#	>=app-crypt/seahorse-${PV}
#	>=gnome-base/gnome-menus-${PV}:3
#	>=gnome-extra/evolution-data-server-${PV}
#	>=gnome-extra/gnome-contacts-${PV}
#	>=gnome-extra/gnome-user-docs-${PV}
#	>=gnome-extra/yelp-${PV}
#	>=media-video/totem-${PV}
#	>=net-im/empathy-${PV}

DEPEND=""

S="${WORKDIR}"
