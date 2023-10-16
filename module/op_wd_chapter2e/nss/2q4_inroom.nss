//::///////////////////////////////////////////////
//:: Is in Room
//:: 2Q4_INROOM
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if a prostitute made it all
    the way to their room.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 14, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"

int StartingConditional()
{
    if(GetLocalPlotIntFromCharacter(OBJECT_SELF) == 20)
    {
        return TRUE;
    }
    MoveTo2Q4PlotPoint(1);
    return FALSE;
}
