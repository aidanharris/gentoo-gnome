# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

VALA_MIN_API_VERSION=0.22

inherit gnome2-utils vala cmake-utils git-r3

DESCRIPTION="The terminal of the 21st century"
HOMEPAGE="https://launchpad.net/pantheon-terminal"
EGIT_REPO_URI="https://github.com/elementary/terminal.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="nls"

RDEPEND="
	dev-libs/glib:2
	>=dev-libs/granite-0.3
	x11-libs/libnotify
	x11-libs/gtk+:3
	x11-libs/vte:2.91[vala]"
DEPEND="${RDEPEND}
	$(vala_depend)
	nls? ( sys-devel/gettext )
	virtual/pkgconfig"

src_prepare() {
	use nls || sed -i '/add_subdirectory (po)/d' CMakeLists.txt

	cmake-utils_src_prepare
	vala_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DGSETTINGS_COMPILE=OFF
		-DVALA_EXECUTABLE="${VALAC}"
	)
	cmake-utils_src_configure
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
