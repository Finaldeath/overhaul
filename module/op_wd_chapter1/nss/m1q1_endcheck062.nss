//::///////////////////////////////////////////////
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character has a high charisma
    Checks if Beggar's Nest plot NOT done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: March13,2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=2) && (GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot")<100))
    {
        return CheckCharismaHigh();
    }
    return FALSE;
}



