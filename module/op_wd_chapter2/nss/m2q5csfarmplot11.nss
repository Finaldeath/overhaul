//::///////////////////////////////////////////////
//:: Leah meets the player, Medium Charisma
//:: M2Q5CSFARMPLOT11
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Leah meets the player, Medium Charisma
*/
//:://////////////////////////////////////////////
//:: Created By: Kevin Martens
//:: Created On: Jan. 22, 2002
//:://////////////////////////////////////////////


#include "nw_i0_plot"

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Rescued") == 0 &&
        GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") == 0)
    {
        return CheckCharismaMiddle();
    }
    return FALSE;
}
