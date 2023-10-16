//::///////////////////////////////////////////////
//:: Give Orc Head
//:: M3Q3A_VAATHB2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gives the PC an orc head
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 15, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    object oHead = GetItemPossessedBy(OBJECT_SELF, "M3Q3_A02VAATH");
    if(GetIsObjectValid(oHead))
    {
         ActionGiveItem(oHead, GetPCSpeaker());
    }

}
