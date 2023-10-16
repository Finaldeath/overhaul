//::///////////////////////////////////////////////
//:: Conversation
//:: 2Q4_Aarin001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Aarin will stop trying to get the PCs attention.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 21, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_CH2E_TALK") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_CH2E_TALK",1);
    }
    PlayCharacterTheme(53);
}
