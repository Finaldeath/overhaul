//::///////////////////////////////////////////////
//:: Name q2d2_ent_freetrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Any freed slaves that make it this far 'escape
    to freedom
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 14/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oSlave = GetEnteringObject();

    if (GetStringLeft(GetTag(oSlave), 12) == "q2dfreeslave" || GetTag(oSlave) == "q2dslaveleader")
    {
        //Give PC a small reward for each slave that is freed
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        SendMessageToPCByStrRef(oPC, 85722 ); //"A Slave has reached freedom."
        Reward_2daXP(oPC, XP_LOW, TRUE);

        DestroyObject(oSlave);

    }
}
