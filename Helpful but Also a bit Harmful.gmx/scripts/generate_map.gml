///generate_map();
var maze_safe = false;
do
{
    var player_x = irandom(ds_grid_width(grid) - 1);
    var player_y = irandom(ds_grid_height(grid) - 1);
    var enemy_x = (ds_grid_width(grid) - 1) - player_x;
    var enemy_y = (ds_grid_height(grid) - 1) - player_y;
    var exit_x = irandom(ds_grid_width(grid) - 1);
    var exit_y = irandom(ds_grid_height(grid) - 1);
    var key_x = irandom(ds_grid_width(grid) - 1);
    var key_y = irandom(ds_grid_height(grid) - 1);
    for (var xx = 0; xx < ds_grid_width(grid); xx++)
    {
        for (var yy = 0; yy < ds_grid_height(grid); yy++)
        {
            ds_map_replace(ds_grid_get(grid,xx,yy),"NORTHDOOR",choose(true,false));
            ds_map_replace(ds_grid_get(grid,xx,yy),"SOUTHDOOR",choose(true,false));
            ds_map_replace(ds_grid_get(grid,xx,yy),"WESTDOOR",choose(true,false));
            ds_map_replace(ds_grid_get(grid,xx,yy),"EASTDOOR",choose(true,false));
            ds_map_replace(ds_grid_get(grid,xx,yy),"START",(player_x == xx && player_y == yy));
            ds_map_replace(ds_grid_get(grid,xx,yy),"KEYROOM",(key_x == xx && key_y == yy));
            ds_map_replace(ds_grid_get(grid,xx,yy),"MONSTERSPAWN",(enemy_x == xx && enemy_y == yy));
            ds_map_replace(ds_grid_get(grid,xx,yy),"EXIT",(exit_x == xx && exit_y == yy));
        }
    }
    var maze_circuited = false;
    var maze_solver_dir = 0;
    var maze_solver_x = player_x;
    var maze_solver_y = player_y;
    var found_exit = false;
    var found_key = false;
    var position_moved = false;
    while(!maze_circuited)
    {
        if (maze_solver_dir == 0)
        {
            if (maze_solver_x != ds_grid_width(grid))
            {
                if (ds_map_find_value(ds_grid_get(grid,maze_solver_x,maze_solver_y),"WESTDOOR"))
                {
                    maze_solver_x += 1;
                    position_moved = true;
                }
                else
                {
                    maze_solver_dir = 90;
                }
            }
            else
            {
                maze_solver_dir = 90;
            }
        }
        else if (maze_solver_dir == 90)
        {
            if (maze_solver_y != 0)
            {
                if (ds_map_find_value(ds_grid_get(grid,maze_solver_x,maze_solver_y),"NORTHDOOR"))
                {
                    maze_solver_y -= 1;
                    position_moved = true;
                }
                else
                {
                    maze_solver_dir = 180;
                }
            }
            else
            {
                maze_solver_dir = 180;
            }
            
        }
        else if (maze_solver_dir == 180)
        {
            if (maze_solver_x != 0)
            {
                if (ds_map_find_value(ds_grid_get(grid,maze_solver_x,maze_solver_y),"EASTDOOR"))
                {
                    maze_solver_x -= 1;
                    position_moved = true;
                }
                else
                {
                    maze_solver_dir = 270;
                }
            }
            else
            {
                maze_solver_dir = 270;
            }        
        }
        else if (maze_solver_dir == 270)
        {
            if (maze_solver_y != ds_grid_height(grid))
            {
                if (ds_map_find_value(ds_grid_get(grid,maze_solver_x,maze_solver_y),"SOUTHDOOR"))
                {
                    maze_solver_y += 1;
                    position_moved = true;
                }
                else
                {
                    maze_solver_dir = 0;
                }
            }
            else
            {
                maze_solver_dir = 0;
            }
        }
        
        if (ds_map_find_value(ds_grid_get(grid,maze_solver_x,maze_solver_y),"EXIT"))
        {
            found_exit = true;
        }
        
        if (ds_map_find_value(ds_grid_get(grid,maze_solver_x,maze_solver_y),"KEYROOM"))
        {
            found_key = true;
        }
        
        if (found_key && found_exit)
        {
            maze_safe = true;
            maze_circuited = true;
        }
        
        if (position_moved && ds_map_find_value(ds_grid_get(grid,maze_solver_x,maze_solver_y),"START"))
        {
            maze_circuited = true;
        }
        
        
    }
    
}
until(maze_safe);

