//::///////////////////////////////////////////////
//:: Nanny Conversation Check Initial
//:: 2Q4E_NANNY01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if she has given the bear away already
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 19, 2002
//:://////////////////////////////////////////////

#include "NW_I0_2Q4LUSKAN"
int StartingConditional()
{
    if(GetLocalPlotIntFromCharacter(OBJECT_SELF) == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
