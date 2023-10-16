//q3b_onenter_save
//Do single player autosave for this area - the first time entered only
//Create pedestals first time entered

#include "nw_i0_plot"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nPedestalsCreated") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nPedestalsCreated", 1);
        //Pedestal of earth (q3b_ped_earth);
        object oWayEarth = GetWaypointByTag("wp_q3b_pedearth_front");
        vector vWayEarth = GetPosition(oWayEarth);
        vector vSpawnEarth = Vector(vWayEarth.x, vWayEarth.y, vWayEarth.z + 2.5);
        location lSpawnEarth = Location(OBJECT_SELF, vSpawnEarth, 0.0);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q3b_ped_earth", lSpawnEarth);

        //Pedestal of Air (q3b_ped_air)
        object oWayAir = GetWaypointByTag("wp_q3b_pedair");
        vector vWayAir = GetPosition(oWayAir);
        vector vSpawnAir = Vector(vWayAir.x, vWayAir.y, vWayAir.z + 2.5);
        location lSpawnAir = Location(OBJECT_SELF, vSpawnAir, 0.0);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q3b_ped_air", lSpawnAir);


    }
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        if (GetLocalInt(oPC, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE") != 1)
        {
            SetLocalInt(oPC, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE", 1);
            DoSinglePlayerAutoSave();

        }
    }

}
