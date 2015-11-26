/*
BlockPlanet


This file is part of BlockPlanet.
Minetest
Copyright (C) 2013 celeron55, Perttu Ahola <celeron55@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef GETTEXT_HEADER
#define GETTEXT_HEADER

#include "config.h" // for USE_GETTEXT

#if USE_GETTEXT
	#include <libintl.h>
#else
	#define gettext(String) String
#endif

#define _(String) gettext(String)
#define gettext_noop(String) (String)
#define N_(String) gettext_noop((String))

void init_gettext(const char *path, const std::string &configured_language,
	int argc, char *argv[]);

extern wchar_t *utf8_to_wide_c(const char *str);

// You must free the returned string!
// The returned string is allocated using new
inline const wchar_t *wgettext(const char *str)
{
	return utf8_to_wide_c(gettext(str));
}

inline std::string strgettext(const std::string &text)
{
	return gettext(text.c_str());
}

#endif
