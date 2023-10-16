//::///////////////////////////////////////////////
//:: M3Q3C_HODD_D.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Hodd's user defined.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 23, 2002
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
}
