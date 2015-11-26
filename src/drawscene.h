/*
BlockPlanet


This file is part of BlockPlanet.
Minetest
Copyright (C) 2010-2014 celeron55, Perttu Ahola <celeron55@gmail.com>

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

#ifndef DRAWSCENE_H_
#define DRAWSCENE_H_

#include "camera.h"
#include "hud.h"
#include "minimap.h"
#include "irrlichttypes_extrabloated.h"


void draw_load_screen(const std::wstring &text, IrrlichtDevice *device,
		gui::IGUIEnvironment *guienv, float dtime = 0, int percent = 0,
		bool clouds = true);

void draw_scene(video::IVideoDriver *driver, scene::ISceneManager *smgr,
		Camera &camera, Client &client, LocalPlayer *player, Hud &hud,
		Mapper &mapper, gui::IGUIEnvironment *guienv,
		std::vector<aabb3f> hilightboxes, const v2u32 &screensize,
		video::SColor skycolor, bool show_hud, bool show_minimap);

#endif /* DRAWSCENE_H_ */
