//::///////////////////////////////////////////////
//:: M3_CULT_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the cultist leader to talk while fighting
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 16, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    if (GetUserDefinedEventNumber() == 1003)
    {
        if (d4()==1)
        {
            SpeakOneLinerConversation();
        }
    }
    if(GetUserDefinedEventNumber() == 1002)
    {
        object oPC = GetLastPerceived();
        if (GetIsPC(oPC))
        {
            SpeakOneLinerConversation();
        }
    }
}
