///generate_room(x,y,width,height,map_id);
var xxxx = argument0;
var yyyy = argument1;
var rwidth = argument2;
var rheight = argument3;
var mid = argument4;
for (var xxxxxx = 0; xxxxxx < rwidth; xxxxxx+= 32)
{
    for (var yyyyyy = 0; yyyyyy < rheight; yyyyyy+= 24)
    {
        var add_wall = true;
        if (ds_map_find_value(mid,"MONSTERSPAWN"))
        {
            if (xxxxxx == rwidth div 2) && (yyyyyy == rheight div 2)
            {
                instance_create(xxxx + xxxxxx,yyyy + yyyyyy,obj_enemy);
            }
        }
        
        if (ds_map_find_value(mid,"NORTHDOOR"))
        {
            if (yyyy != 0)
            {
                if ((xxxxxx == rwidth div 2) || (xxxxxx == (rwidth div 2) + 1) || (xxxxxx == (rwidth div 2) - 1))
                 && (yyyyyy == 0 || yyyyyy == 1)
                {
                    add_wall = false;
                }            
            }

        }
        
        if (ds_map_find_value(mid,"SOUTHDOOR"))
        {
            if (yyyy != room_width/rwidth)
            {
                if ((xxxxxx == rwidth div 2) || (xxxxxx == (rwidth div 2) + 1) || (xxxxxx == (rwidth div 2) - 1))
                && (yyyyyy == rheight - 1 || yyyyyy == rheight - 2)
                {
                    add_wall = false;
                }          
            }

        }
        
        if (ds_map_find_value(mid,"EASTDOOR"))
        {
            if (xxxx != room_width/rwidth)
            {
                if (xxxxxx == rwidth - 1 || xxxxxx == rwidth - 2) && ((yyyyyy == rheight div 2)||
                (yyyyyy == (rheight div 2) + 1) || (yyyyyy == (rheight div 2) - 1))
                {
                    add_wall = false;
                }            
            }

        }
        
        if (ds_map_find_value(mid,"WESTDOOR"))
        {
            if (xxxx != 0)
            {
                if ((xxxxxx == 0 || xxxxxx == 1)) && ((yyyyyy == rheight div 2)||
                (yyyyyy == (rheight div 2) + 1) || (yyyyyy == (rheight div 2) - 1))
                {
                    add_wall = false;
                }            
            }

        }
        
        if (ds_map_find_value(mid,"KEYROOM"))
        {
            if (xxxxxx == rwidth div 2) && (yyyyyy == rheight div 2)
            {
                instance_create(xxxx + xxxxxx,yyyy + yyyyyy,obj_key);
            }
        }
        
        if (ds_map_find_value(mid,"EXIT"))
        {
            if (xxxxxx == rwidth div 2) && (yyyyyy == rheight div 2)
            {
                instance_create(xxxx + xxxxxx,yyyy + yyyyyy, obj_exit);
            }
        
        }
        
        if (ds_map_find_value(mid,"START"))
        {
            if (xxxxxx == rwidth div 2) && (yyyyyy == rheight div 2)
            {
                instance_create(xxxx + xxxxxx,yyyy + yyyyyy, obj_player);
            }
        }
        
        if (xxxxxx > 0 && xxxxxx < rwidth)
        {
            if (yyyyyy > 0 && (yyyyyy < rheight))
            {
                add_wall = false;
            }
        }
        
        if (add_wall)
        {
            tile_add(tile_brick,0,0,32,24,(xxxx) + xxxxxx,(yyyy) + yyyyyy,-5);
        }
        
    }
}
