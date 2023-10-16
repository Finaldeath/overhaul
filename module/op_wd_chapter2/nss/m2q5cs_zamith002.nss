//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q5cs_Zamith002
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks: Is Charisma High AND
            Is Gender the opposite AND
            She has not been turned down once by
            the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 4, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    if((GetGender(GetPCSpeaker()) != GetGender(OBJECT_SELF)) &&
        CheckCharismaNormal() &&
        GetLocalInt(GetPCSpeaker(),"NW_L_ZamithRefused") == 0)
    {
        return TRUE;
    }
    return FALSE;
}
