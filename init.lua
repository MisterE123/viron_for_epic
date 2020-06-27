local mob_drops
viron_drops = {
  {name = 'default:mese_shard', chance = 3, min = 1, max = 2},
  {name = 'default:steel', chance = 4, min = 1, max = 2},
  {name = 'default:iron_lump', chance = 2, min = 1, max = 2},
  {name = 'default:meselamp', chance = 3, min = 1, max = 2},
  {name = 'default:mese_crystal', chance = 6, min = 1, max = 1},
  {name = 'default:diamond', chance = 5, min = 1, max = 1},
  {name = 'default:diamond_block', chance = 20, min = 1, max = 1},
}
local viron_queen_drops
viron_queen_drops = {
  {name = 'default:mese_shard', chance = 3, min = 1, max = 2},
  {name = 'default:steel', chance = 4, min = 1, max = 2},
  {name = 'default:iron_lump', chance = 2, min = 1, max = 2},
  {name = 'default:meselamp', chance = 3, min = 1, max = 6},
  {name = 'default:mese_crystal', chance = 3, min = 1, max = 5},
  {name = 'default:diamond', chance = 2, min = 1, max = 2},
  {name = 'default:diamond_block', chance = 2, min = 1, max = 3},
}

--these vars are used to set relative sizes between virons and their larve and queens
local viron_selection_box
local viron_visual_size

viron_selection_box = {-0.3, -0.5, -0.3, 0.3, 1.5, 0.3}
viron_visual_size = {x = 1, y = 1}


mobs:register_mob('viron:viron_mob', {
   type = 'monster',
   hp_min = 35,
   hp_max = 80,
   armor = 75,
   passive = false,
   walk_velocity = 4,
   stand_chance = 60,
   walk_chance = 10,
   fall_speed = -3,
   jump = true,
   jump_height = 8,
   run_velocity = 6,
   stepheight = 15,
   stay_near = {
      nodes = {'asteroid:diamondore', 'asteroid:meseore',},
      },
   pushable = true,
   view_range = 15,
   damage = 15,
   knock_back = true,
   fear_height = 10,
   water_damage = 0,
   lava_damage = 0,
   light_damage = 0,
   suffocation = false,
   floats = false,
   follow = {
      'default:diamond',
      'default:mese_crystal',
   },
   reach = 2,
   attack_chance = 70,
   attack_monsters = false,
   attack_animals = true,
   attack_npcs = true,
   attack_players = true,
   group_attack = true,
   attack_type = 'dogfight',
   blood_texture = 'viron_blood.png',
   pathfinding = 1,
   makes_footstep_sound = false,
   sounds = {
      distance = 25,
      random = 'viron_viron_talk',
      war_cry = 'viron_viron_angry',
      attack = 'viron_viron_hit',
      damage = 'viron_viron_angry',
      death = 'viron_viron_die',
      jump = 'viron_viron_talk',
   },
   drops = viron_drops,
   visual = 'mesh',
   collisionbox = viron_selection_box,
   selectionbox = viron_selection_box,
   mesh = 'viron_viron_mob.b3d',
   textures = {
      {'viron_viron_texture.png'}, {'viron_viron_texture1.png'}, {'viron_viron_texture2.png'},
   },
   glow = 10,
   animation = {
      stand_start = 40,
      stand_end = 85,
      stand_speed = 10,
      stand1_start = 87,
      stand1_end = 100,
      stand1_speed = 10,
      stand2_start = 103,
      stand2_end = 145,
      stand2_speed = 10,
      stand3_start = 140,
      stand3_end = 170,
      stand3_speed = 5,
      stand3_loop = false,
      walk_start = 0,
      walk_end = 30,
      walk_speed = 30,
      run_start = 0,
      run_end = 30,
      run_speed = 50,
      punch_start = 170,
      punch_end = 200,
      punch_speed = 27,
   },
   on_die = function(self, pos)
      local num = math.random(1, 7)
      for i=1,num do
         minetest.add_entity({x=pos.x + math.random(-2, 2), y=pos.y + 1, z=pos.z + (math.random(-2, 2))}, 'viron:viron_larve')
      end
   end,
})

mobs:spawn({
   name = 'viron:viron_mob',
   nodes = {'asteroid:redstone', 'asteroid:stone', 'asteroid:gravel', 'asteroid:redgravel'},
   chance = 10,
   interval = 30,
   active_object_count = 2,
   min_height = 5000,
   max_height = 7000,
})

mobs:register_egg('viron:viron_mob', 'Viron', 'viron_viron_egg.png', 1)



----------------------------- Queen-------------------------------


mobs:register_mob('viron:viron_queen', {
   type = 'monster',
   hp_min = 100,
   hp_max = 800,
   armor = 80,
   passive = false,
   walk_velocity = 5,
   stand_chance = 60,
   walk_chance = 10,
   fall_speed = -4,
   jump = true,
   jump_height = 40,
   run_velocity = 10,
   stepheight = 20,
   stay_near = {
      nodes = {'asteroid:diamondore', 'asteroid:meseore',},
      },
   pushable = true,
   view_range = 15,
   damage = 90,
   knock_back = true,
   fear_height = 20,
   water_damage = 0,
   lava_damage = 0,
   light_damage = 0,
   suffocation = false,
   floats = false,
   follow = {
      'default:diamond',
      'default:mese_crystal',
   },
   reach = 4,
   attack_chance = 70,
   attack_monsters = false,
   attack_animals = true,
   attack_npcs = true,
   attack_players = true,
   group_attack = true,
   attack_type = 'dogfight',
   blood_texture = 'viron_blood.png',
   pathfinding = 1,
   makes_footstep_sound = false,
   sounds = {
      distance = 25,
      random = 'viron_viron_talk',
      war_cry = 'viron_viron_angry',
      attack = 'viron_viron_hit',
      damage = 'viron_viron_angry',
      death = 'viron_viron_die',
      jump = 'viron_viron_talk',
   },
   drops = viron_queen_drops,
   visual = 'mesh',
   visual_size = {
      x = viron_visual_size.x * 4,
      y = viron_visual_size.y * 4,
   },
   collisionbox = {
      viron_selection_box[1] * 4,
      viron_selection_box[2] * 4,
      viron_selection_box[3] * 4,
      viron_selection_box[4] * 4,
      viron_selection_box[5] * 4,
      viron_selection_box[6] * 4,
   },
   selectionbox = {
      viron_selection_box[1] * 4,
      viron_selection_box[2] * 4,
      viron_selection_box[3] * 4,
      viron_selection_box[4] * 4,
      viron_selection_box[5] * 4,
      viron_selection_box[6] * 4,
   },
   mesh = 'viron_viron_mob.b3d',
   textures = {
      {'viron_viron_texture.png'}, {'viron_viron_texture1.png'}, {'viron_viron_texture2.png'},
   },
   glow = 12,
   animation = {
      stand_start = 40,
      stand_end = 85,
      stand_speed = 10,
      stand1_start = 87,
      stand1_end = 100,
      stand1_speed = 10,
      stand2_start = 103,
      stand2_end = 145,
      stand2_speed = 10,
      stand3_start = 140,
      stand3_end = 170,
      stand3_speed = 5,
      stand3_loop = false,
      walk_start = 0,
      walk_end = 30,
      walk_speed = 30,
      run_start = 0,
      run_end = 30,
      run_speed = 50,
      punch_start = 170,
      punch_end = 200,
      punch_speed = 27,
   },
   on_die = function(self, pos)
      local num = math.random(1, 5)
      for i=1,num do
         minetest.add_entity({x=pos.x + math.random(-2, 2), y=pos.y + 1, z=pos.z + (math.random(-2, 2))}, 'viron:viron_mob')
      end
   end,

})

mobs:spawn({
   name = 'viron:viron_queen',
   nodes = {'asteroid:redstone', 'asteroid:stone', 'asteroid:gravel', 'asteroid:redgravel'},
   chance = 300,
   interval = 30,
   active_object_count = 2,
   min_height = 5000,
   max_height = 7000,
})

mobs:register_egg('viron:viron_queen', 'Viron Queen', 'viron_viron_egg.png', 1)

------------------------------Larve-----------------------------------------




mobs:register_mob('viron:viron_larve', {
   type = 'monster',
   hp_min = 10,
   hp_max = 40,
   armor = 80,
   passive = false,
   walk_velocity = 2,
   stand_chance = 10,
   walk_chance = 60,
   jump = true,
   jump_height = 10,
   run_velocity = 5,
   fall_speed = -3,
   stepheight = 10,
   pushable = true,
   view_range = 15,
   damage = 15,
   knock_back = true,
   fear_height = 20,
   water_damage = 0,
   lava_damage = 0,
   light_damage = 0,
   suffocation = false,
   floats = false,
   follow = {
      'default:diamond',
      'default:mese_crystal',
   },
   reach = 1,
   attack_chance = 10,
   attack_monsters = false,
   attack_animals = true,
   attack_npcs = true,
   attack_players = false,
   runaway = true,
   group_attack = false,
   attack_type = 'dogfight',
   blood_texture = 'viron_blood.png',
   pathfinding = 1,
   makes_footstep_sound = false,
   sounds = {
      distance = 25,
      random = 'viron_viron_talk',
      war_cry = 'viron_viron_angry',
      attack = 'viron_viron_hit',
      damage = 'viron_viron_angry',
      death = 'viron_viron_die',
      jump = 'viron_viron_talk',
   },
   visual = 'mesh',
   visual_size = {
      x = viron_visual_size.x * .5,
      y = viron_visual_size.y * .5,
   },
   collisionbox = {
      viron_selection_box[1] * .5,
      viron_selection_box[2] * .5,
      viron_selection_box[3] * .5,
      viron_selection_box[4] * .5,
      viron_selection_box[5] * .5,
      viron_selection_box[6] * .5,
   },
   selectionbox = {
      viron_selection_box[1] * .5,
      viron_selection_box[2] * .5,
      viron_selection_box[3] * .5,
      viron_selection_box[4] * .5,
      viron_selection_box[5] * .5,
      viron_selection_box[6] * .5,
   },
   mesh = 'viron_viron_mob.b3d',
   textures = {
      {'viron_viron_texture.png'}, {'viron_viron_texture1.png'}, {'viron_viron_texture2.png'},
   },
   glow = 12,
   animation = {
      stand_start = 40,
      stand_end = 85,
      stand_speed = 10,
      stand1_start = 87,
      stand1_end = 100,
      stand1_speed = 10,
      stand2_start = 103,
      stand2_end = 145,
      stand2_speed = 10,
      stand3_start = 140,
      stand3_end = 170,
      stand3_speed = 5,
      stand3_loop = false,
      walk_start = 0,
      walk_end = 30,
      walk_speed = 30,
      run_start = 0,
      run_end = 30,
      run_speed = 50,
      punch_start = 170,
      punch_end = 200,
      punch_speed = 27,
   },
   do_custom = function(self,dtime)
     -- 20 sec timer, wait to grow the mob until it has been alive for 60 sec
 		self.grow_timer = (self.grow_timer or 0) + dtime
 		if self.grow_timer < 20 then
 			return
 		end
    local pos = self.object:get_pos()
    --if the code has gotten to here, the viron_larve has been alive for more than 60 second
    --so now we grow the mob by removing (killing) it and placing a viron.
    minetest.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, 'viron:viron_mob')
    self.object:remove()
    return false




  end,


})
