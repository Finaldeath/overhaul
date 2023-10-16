//::///////////////////////////////////////////////
//:: Spawn in a Qasit
//:: 2Q6D_AbyssSpawn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks how many quasits are on the map
    and spawn in one to move to the center of
    the map.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 24, 2002
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if(GetIsObjectValid(oPC) && GetDistanceToObject(oPC) < 100.0 && GetDistanceToObject(oPC) > 10.0)
    {
        object oTarget = GetNearestObjectByTag("2Q6_Quasit", OBJECT_SELF, 4);
        if(!GetIsObjectValid(oTarget))
        {
            CreateObject(OBJECT_TYPE_CREATURE, "2Q6_Quasit", GetLocation(OBJECT_SELF));
        }
    }
}
