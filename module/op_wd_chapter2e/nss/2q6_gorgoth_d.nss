//::///////////////////////////////////////////////
//:: Gorgoth Custom User Defined Event
//:: 2q6_gorgoth_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Launch Chapter 3
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 12, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();
    int nPlot = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START");
    if(nUser == 1001 && nPlot == 5) //HEARTBEAT
    {
        object oWay = GetWaypointByTag("2Q6K_MORAG");
        vector vWay = GetPosition(oWay);
        SetFacingPoint(vWay);
        ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 1000.0);
    }
    else if(nUser == 1001 && nPlot == 15)
    {
        object oPC = GetFirstPC();//GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if(GetIsObjectValid(oPC))
        {
            AdjustReputation(oPC, OBJECT_SELF, -100);
            ClearAllActions();
            SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT, FALSE);
            DetermineCombatRound();
        }
    }
}

