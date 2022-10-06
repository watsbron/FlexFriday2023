#region Define Key Input Variables
var _up = keyboard_check(ord("W")) or keyboard_check(vk_up),
_down = keyboard_check(ord("S")) or keyboard_check(vk_down),
_left = keyboard_check(ord("A")) or keyboard_check(vk_left),
_right = keyboard_check(ord("D")) or keyboard_check(vk_right),
_esc = keyboard_check(vk_delete) or keyboard_check(vk_escape),
_endDay = keyboard_check_pressed(ord("X")),
_reset = keyboard_check_pressed(ord("R")),
#endregion
#region Movement
if _up {
	yy -= moveSpeed
}
if _down {
	yy += moveSpeed
}
if _left {
	xx -= moveSpeed
	xsc = -1
}
if _right {
	xx += moveSpeed
	xsc = 1
}

y = lerp(y,yy,la);
x = lerp(x,xx,la);
#endregion Movement
#region Saving & Exiting
if _esc {
leaving += 0.02;
} else {
leaving = 0;	
}

if leaving >= 2 {
game_end();	
}

if _endDay {
xx = oBed.x
yy = oBed.y
day += 1
ini_open("savedata.ini");
ini_write_real("savedata", "day", day);
ini_close();
}

if _reset {
ini_open("savedata.ini");
ini_section_delete("savedata")
ini_close();
day = 0
}
#endregion
#region interact
//if ((distance_to_object(instance_nearest(x,y,oInteractable))< 18 )&& _interact && !instance_exists(oTextBox)) {
//	var _s = oInteractable._s
//	var text_id = oInteractatext_id
//	with instance_create_layer(x,y,"Dialogue",oTextBox)
//	{
//	sGameText(_s.text_id);
//	}
//	show_debug_message("Interacted is true");
//}
#endregion
#region movement with dialogue boxes
if instance_exists(oTextBox) {
moveSpeed = 0;	
} else {
moveSpeed = 2;
}
#endregion
#region depth ordering
depth = -bbox_bottom;
#endregion
#region deactivate instances outside player

#endregion