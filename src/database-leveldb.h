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

#ifndef DATABASE_LEVELDB_HEADER
#define DATABASE_LEVELDB_HEADER

#include "config.h"

#if USE_LEVELDB

#include "database.h"
#include "leveldb/db.h"
#include <string>

class Database_LevelDB : public Database
{
public:
	Database_LevelDB(const std::string &savedir);
	~Database_LevelDB();

	virtual bool saveBlock(const v3s16 &pos, const std::string &data);
	virtual std::string loadBlock(const v3s16 &pos);
	virtual bool deleteBlock(const v3s16 &pos);
	virtual void listAllLoadableBlocks(std::vector<v3s16> &dst);

private:
	leveldb::DB *m_database;
};

#endif // USE_LEVELDB

#endif
