//::///////////////////////////////////////////////
//:: Bloody Hand Patrol
//:: 2Q4_Module_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns a Black Knife or a Bloody Hand to travel
    into enemy territory if does not detect one.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////


void main()
{
    object oBlack = GetObjectByTag("2Q4_BaramAss");
    object oBlood = GetObjectByTag("2Q4_KurthAss");
    object oWayBlood = GetWaypointByTag("WP_2Q4_KurthAss_01");
    object oWayBlack = GetWaypointByTag("WP_2Q4_BaramAss_01");

    if(!GetIsObjectValid(oBlood))
    {
       CreateObject(OBJECT_TYPE_CREATURE,"2Q4_KurthAss", GetLocation(oBlood));
    }
    if(!GetIsObjectValid(oBlack))
    {
       CreateObject(OBJECT_TYPE_CREATURE,"2Q4_BaramAss", GetLocation(oBlack));
    }


}
