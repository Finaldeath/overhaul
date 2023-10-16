//::///////////////////////////////////////////////
//:: Infiltrator Patrols
//:: 2Q4_Luskan_1
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
    object oPC;

    oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oWayBlood);
    if(GetIsObjectValid(oPC) && GetDistanceBetween(oWayBlood, oPC) > 40.0)
    {
        if(!GetIsObjectValid(oBlood))
        {
           CreateObject(OBJECT_TYPE_CREATURE,"2q4_mh_kurtha001", GetLocation(oWayBlood));
        }
    }
    oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oWayBlack);
    if(GetIsObjectValid(oPC) && GetDistanceBetween(oWayBlack, oPC) > 20.0)
    {
        if(!GetIsObjectValid(oBlack))
        {
           CreateObject(OBJECT_TYPE_CREATURE,"2q4_baramass002", GetLocation(oWayBlack));
        }
    }
}
