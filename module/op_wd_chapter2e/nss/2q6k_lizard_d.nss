//::///////////////////////////////////////////////
//:: Lizardfolk Custom User Defined Event
//:: 2Q6K_Lizard_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes the lizardfolk whorship Morag.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 3, 2002
//:://////////////////////////////////////////////
#include "NW_I0_HOSTINCL"
#include "NW_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();
    int nPlot = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START");
    if(nUser == 1001 && nPlot < 15) //HEARTBEAT
    {
        object oWay = GetWaypointByTag("2Q6K_MORAG");
        vector vWay = GetPosition(oWay);
        SetFacingPoint(vWay);
        ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 1000.0);
        SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
    }
    else if(nUser == 1001 && nPlot == 15)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        AdjustReputation(oPC, OBJECT_SELF, -100);
        ClearAllActions();
        SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT, FALSE);
        DetermineCombatRound();
    }
    else if(nUser == 1006 || nUser == 1011)
    {
        SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START", 99);
    }
}

