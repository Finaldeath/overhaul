//::///////////////////////////////////////////////
//:: Check that Gen Plot is not False
//:: 2Q4_CHKGENPLOT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the local generic plot flag is at 0
    for the character.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 14, 2002
//:://////////////////////////////////////////////

#include "NW_I0_2Q4LUSKAN"

int StartingConditional()
{
    if(!GetLocalPlotIntFromCharacter(OBJECT_SELF))
    {
        return TRUE;
    }
    return FALSE;
}

