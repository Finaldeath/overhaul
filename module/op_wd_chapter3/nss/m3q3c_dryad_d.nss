//::///////////////////////////////////////////////
//:: M3Q3C_DYRAD_D.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dryad's in SnowGlobe user defined event.
    They act more 'hostile' when the snowglobe
    is turned one way than in other situations.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    if ((GetUserDefinedEventNumber() == 1003) && (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 10) && GetIsInCombat())
    {
        if (Random(100) < 33)
        {
            DimensionHop(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY));
        }
        if (d4()==1)
        {
            SpeakOneLinerConversation();
        }


    }
    // * else dryad is on  the defensive
    else   if (GetUserDefinedEventNumber() == 1003 && GetIsInCombat())
    {
        // * Calls to the player to help her
        if (d4()==1)
        {
            SpeakOneLinerConversation();
        }
    }
    else if (GetUserDefinedEventNumber() == 1001 && !GetIsInCombat() && !IsInConversation(OBJECT_SELF))
    {
        ClearAllActions();
        ActionRandomWalk();
    }
}
