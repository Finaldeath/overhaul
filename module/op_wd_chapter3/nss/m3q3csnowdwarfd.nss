//::///////////////////////////////////////////////
//:: M3Q3CSnowDwarfD.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dwarf's in the snowglobe
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    if ((GetUserDefinedEventNumber() == 1003)
        && (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 1)
        && GetIsInCombat())
    {
        if (d4()==1)
        {
            SpeakOneLinerConversation();
        }
    }
    // * else dryad is on  the defensive
    else  if ((GetUserDefinedEventNumber() == 1003) && GetIsInCombat())
    {
        // * Calls to the player to help him
        if (d4()==1)
        {
            SpeakOneLinerConversation();
        }
    }
    else if (GetUserDefinedEventNumber() == 1001
    && !GetIsInCombat() && !IsInConversation(OBJECT_SELF))
    {
        ClearAllActions();
        ActionRandomWalk();
    }
}
