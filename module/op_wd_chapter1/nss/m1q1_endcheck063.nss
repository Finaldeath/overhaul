//::///////////////////////////////////////////////
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character has a high charisma
    Checks if Peninsula plot done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: MArch13,2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=3) && (GetLocalInt(GetModule(),"NW_G_M1Q2MainPlot")==100))
    {
        return CheckCharismaHigh();
    }
    return FALSE;
}


