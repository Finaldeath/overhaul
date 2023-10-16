//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q5cs_Zamith001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks: Is Charisma Low OR
            Is Gender the same OR
            She has been turned down once by the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 4, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    if((GetGender(GetPCSpeaker()) == GetGender(OBJECT_SELF)) ||
        CheckCharismaLow() ||
        GetLocalInt(GetPCSpeaker(),"NW_L_ZamithRefused") == 1)
    {
        return TRUE;
    }
    return FALSE;
}
