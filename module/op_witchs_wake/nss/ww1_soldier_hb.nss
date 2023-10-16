//::///////////////////////////////////////////////
//:: Witchwork 1: Cinematic Soldier Heartbeat
//:: WW1_Soldier_HB.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Get the nearest NPC and attack it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oArea = GetArea(OBJECT_SELF);
    int bCinematicOn = GetLocalInt(oArea, "bCinematicOn");
    object oNearest = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC);

    if (bCinematicOn == TRUE)
    {
        ClearAllActions();
        ActionAttack(oNearest);
    }
}
