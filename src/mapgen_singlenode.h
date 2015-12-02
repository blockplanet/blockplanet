/*
BlockPlanet


This file is part of BlockPlanet.
Minetest
Copyright (C) 2010-2015 celeron55, Perttu Ahola <celeron55@gmail.com>

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

#ifndef MAPGEN_SINGLENODE_HEADER
#define MAPGEN_SINGLENODE_HEADER

#include "mapgen.h"

struct MapgenSinglenodeParams : public MapgenSpecificParams {

	MapgenSinglenodeParams() {}
	~MapgenSinglenodeParams() {}

	void readParams(const Settings *settings) {}
	void writeParams(Settings *settings) const {}
};

class MapgenSinglenode : public Mapgen {
public:
	u32 flags;
	content_t c_node;
	u8 set_light;

	MapgenSinglenode(int mapgenid, MapgenParams *params, EmergeManager *emerge);
	~MapgenSinglenode();

	void makeChunk(BlockMakeData *data);
	int getGroundLevelAtPoint(v2s16 p);
};

struct MapgenFactorySinglenode : public MapgenFactory {
	Mapgen *createMapgen(int mgid, MapgenParams *params, EmergeManager *emerge) {
		return new MapgenSinglenode(mgid, params, emerge);
	};

	MapgenSpecificParams *createMapgenParams() {
		return new MapgenSinglenodeParams();
	};
};

#endif
