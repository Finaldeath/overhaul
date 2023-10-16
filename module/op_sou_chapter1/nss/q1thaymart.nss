//::///////////////////////////////////////////////
//:: Name q1thaymart
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Execute the script that sets up the Thaymart store
   in Hilltop and kicks commoner 3 (q1houseguy),
   out of his house
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 27/03
//:://////////////////////////////////////////////

void CreateThayMart();

void main()
{
    if (GetLocalInt(GetModule(), "X1_Q1BThayStore") != 1)
    {
        DelayCommand(60.0, CreateThayMart());
        SetLocalInt(GetModule(), "X1_Q1BThayStore", 1);
    }
}

void CreateThayMart()
{
    //locations
    location lWaySzaren = GetLocation(GetWaypointByTag("wp_q1thay_szaren"));
    location lWaySol1 = GetLocation(GetWaypointByTag("wp_q1thay_sol1"));
    location lWaySol2 = GetLocation(GetWaypointByTag("wp_q1thay_sol2"));
    location lWayBooks1 = GetLocation(GetWaypointByTag("wp_q1thay_books1"));
    location lWayBooks2 = GetLocation(GetWaypointByTag("wp_q1thay_books2"));
    location lWayCrate1 = GetLocation(GetWaypointByTag("wp_q1thay_crate1"));
    location lWayCrate2 = GetLocation(GetWaypointByTag("wp_q1thay_crate2"));
    location lWayCrate3 = GetLocation(GetWaypointByTag("wp_q1thay_crate3"));
    location lWayCrate4 = GetLocation(GetWaypointByTag("wp_q1thay_crate4"));
    location lWayCrate5 = GetLocation(GetWaypointByTag("wp_q1thay_crate5"));
    location lWayRug1 = GetLocation(GetWaypointByTag("wp_q1thay_rug1"));
    location lWayRug2 = GetLocation(GetWaypointByTag("wp_q1thay_rug2"));
    location lWayPed = GetLocation(GetWaypointByTag("wp_q1thay_ped"));
    location lWaySign = GetLocation(GetWaypointByTag("wp_q1thay_sign"));
    location lWayCommon = GetLocation(GetWaypointByTag("wp_q1thay_common"));
    location lWaySlave = GetLocation(GetWaypointByTag("wp_q1thay_slave"));

    //objects
    object oCommoner = GetObjectByTag("q1houseguy");
    object oDoor = GetObjectByTag("q1b_ext_house3");

    //Jump House Guy outside
    SetLocalInt(oCommoner, "nKickedOutOfHome", 1);
    AssignCommand(oCommoner, ActionJumpToLocation(lWayCommon));

    //Create Sign
    CreateObject(OBJECT_TYPE_PLACEABLE, "q1thaysign", lWaySign);

    //Create Placeables inside house
    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_solblue", lWaySol1);
    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_solblue", lWaySol2);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q1statbooks", lWayBooks1);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q1statbooks", lWayBooks2);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q1statcrate2", lWayCrate1);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q1statcrate3", lWayCrate2);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q1statcrate4", lWayCrate3);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q1statcrate2", lWayCrate4);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q1statcrate3", lWayCrate5);
    CreateObject(OBJECT_TYPE_PLACEABLE, "x0_ruglarge", lWayRug1);
    CreateObject(OBJECT_TYPE_PLACEABLE, "x0_ruglarge", lWayRug2);
    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_pedestal", lWayPed);

    //Create merchant szaren and slave
    CreateObject(OBJECT_TYPE_CREATURE, "q1storeszaren", lWaySzaren);
    CreateObject(OBJECT_TYPE_CREATURE, "q1thayslave", lWaySlave);

    //Unlock front door
    SetLocked(oDoor, FALSE);

}
