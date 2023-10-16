// whenever used - switch the paths between the 4 colors and display the right light pillar
// initialy - no path is active. The system returns to non-active state after the doors are opened.
// the switch also create magical tokens at the urn to the right. The tokens are created only when
// first using the switch and after each path is completed.

//** UPDATE 04/04 - Disable token creation
int ACTIVE_PATH_NONE  = 0;
int ACTIVE_PATH_WATER = 1;
int ACTIVE_PATH_AIR   = 2;
int ACTIVE_PATH_EARTH = 3;
int ACTIVE_PATH_FIRE  = 4;

void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    object oWP = GetWaypointByTag("Q3B_WP_ACTIVE_PATH");
    object oCurrentPath = GetLocalObject(GetArea(OBJECT_SELF), "Q3_ACTIVE_LIGHT_OBJECT");
    int nActive = GetLocalInt(GetArea(OBJECT_SELF), "Q3_CURRENT_ACTIVE_PATH");


    if(oCurrentPath != OBJECT_INVALID)
            DestroyObject(oCurrentPath); // first - destroying the old light

    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));

    if(nActive == ACTIVE_PATH_NONE) // then activate the water
    {
        oCurrentPath = CreateObject(OBJECT_TYPE_PLACEABLE, "q3_water_path", GetLocation(oWP));
        SetLocalInt(GetArea(OBJECT_SELF), "Q3_CURRENT_ACTIVE_PATH",ACTIVE_PATH_WATER);
        //open the blue door
        object oBlueDoor = GetObjectByTag("q3bluedoor");
        AssignCommand(oBlueDoor, ActionOpenDoor(oBlueDoor));
    }
    else if(nActive == ACTIVE_PATH_WATER) // then disable water and activate air
    {
        oCurrentPath = CreateObject(OBJECT_TYPE_PLACEABLE, "q3_fire_path", GetLocation(oWP));
        SetLocalInt(GetArea(OBJECT_SELF), "Q3_CURRENT_ACTIVE_PATH",ACTIVE_PATH_FIRE);
        //close the blue door
        object oBlueDoor = GetObjectByTag("q3bluedoor");
        AssignCommand(oBlueDoor, ActionCloseDoor(oBlueDoor));
        //open the red door
        object oRedDoor = GetObjectByTag("q3reddoor");
        AssignCommand(oRedDoor, ActionOpenDoor(oRedDoor));
    }
    else if(nActive == ACTIVE_PATH_FIRE) // then disable fire and activate air
    {
        oCurrentPath = CreateObject(OBJECT_TYPE_PLACEABLE, "q3_air_path", GetLocation(oWP));
        SetLocalInt(GetArea(OBJECT_SELF), "Q3_CURRENT_ACTIVE_PATH",ACTIVE_PATH_AIR);
        //close the red door
        object oRedDoor = GetObjectByTag("q3reddoor");
        AssignCommand(oRedDoor, ActionCloseDoor(oRedDoor));
        //open the white door
        object oWhiteDoor = GetObjectByTag("q3whitedoor");
        AssignCommand(oWhiteDoor, ActionOpenDoor(oWhiteDoor));
    }
    else if(nActive == ACTIVE_PATH_AIR) // then disable air and activate earth
    {
        oCurrentPath = CreateObject(OBJECT_TYPE_PLACEABLE, "q3_earth_path", GetLocation(oWP));
        SetLocalInt(GetArea(OBJECT_SELF), "Q3_CURRENT_ACTIVE_PATH",ACTIVE_PATH_EARTH);
        //close the white door
        object oWhiteDoor = GetObjectByTag("q3whitedoor");
        AssignCommand(oWhiteDoor, ActionCloseDoor(oWhiteDoor));
        //open the green door
        object oGreenDoor = GetObjectByTag("q3greendoor");
        AssignCommand(oGreenDoor, ActionOpenDoor(oGreenDoor));
   }
    else if(nActive == ACTIVE_PATH_EARTH) // then disable earth and activate fire
    {
        oCurrentPath = CreateObject(OBJECT_TYPE_PLACEABLE, "q3_water_path", GetLocation(oWP));
        SetLocalInt(GetArea(OBJECT_SELF), "Q3_CURRENT_ACTIVE_PATH",ACTIVE_PATH_WATER);
        //close the green door
        object oGreenDoor = GetObjectByTag("q3greendoor");
        AssignCommand(oGreenDoor, ActionCloseDoor(oGreenDoor));
        //open the blue door
        object oBlueDoor = GetObjectByTag("q3bluedoor");
        AssignCommand(oBlueDoor, ActionOpenDoor(oBlueDoor));
    }

    // finally - setting the light object for next time, so it would be easier to destroy it.
    SetLocalObject(GetArea(OBJECT_SELF), "Q3_ACTIVE_LIGHT_OBJECT", oCurrentPath);


}
