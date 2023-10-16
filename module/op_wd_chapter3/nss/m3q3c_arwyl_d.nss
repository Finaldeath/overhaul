//::///////////////////////////////////////////////
//:: M3Q3C_ARWYL_D.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets Arwyl to cry out while fighting.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 23, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    if ((GetUserDefinedEventNumber() == 1003)
        && (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 10)
        && GetIsInCombat())
    {
        if (d4()==1)
        {
            SpeakOneLinerConversation();
        }
    }
    // * else dwarf is on  the defensive
    else  if ((GetUserDefinedEventNumber() == 1003) && GetIsInCombat())
    {
        // * Calls to the player to help her
        if (d4()==1)
        {
            SpeakOneLinerConversation();
        }
    }
}
