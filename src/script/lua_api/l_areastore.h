/*
BlockPlanet


This file is part of BlockPlanet.
Minetest
Copyright (C) 2015 est31 <mtest31@outlook.com>

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

#ifndef L_AREASTORE_H_
#define L_AREASTORE_H_

#include "lua_api/l_base.h"
#include "irr_v3d.h"
#include "areastore.h"

/*
  AreaStore
 */
class LuaAreaStore : public ModApiBase {
private:

	static const char className[];
	static const luaL_reg methods[];

	static int gc_object(lua_State *L);

	static int l_get_area(lua_State *L);

	static int l_get_areas_for_pos(lua_State *L);
	static int l_get_areas_in_area(lua_State *L);
	static int l_insert_area(lua_State *L);
	static int l_reserve(lua_State *L);
	static int l_remove_area(lua_State *L);

	static int l_set_cache_params(lua_State *L);

	/* static int l_to_string(lua_State *L);
	static int l_to_file(lua_State *L);

	static int l_from_string(lua_State *L);
	static int l_from_file(lua_State *L); */

public:
	AreaStore *as;

	LuaAreaStore();
	LuaAreaStore(const std::string &type);
	~LuaAreaStore();

	// AreaStore()
	// Creates a AreaStore and leaves it on top of stack
	static int create_object(lua_State *L);

	static LuaAreaStore *checkobject(lua_State *L, int narg);

	static void Register(lua_State *L);
};

#endif /* L_AREASTORE_H_ */
