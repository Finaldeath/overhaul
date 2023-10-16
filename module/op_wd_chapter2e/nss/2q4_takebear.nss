//::///////////////////////////////////////////////
//:: Take the Bear
//:: 2q4_takebear
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Londa takes the Bear
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 28, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    object oBear = GetItemPossessedBy(GetPCSpeaker(), "M2Q4A_Child_Toy");
    if(GetIsObjectValid(oBear))
    {
        DestroyObject(oBear, 0.0);
        CreateItemOnObject("2Q4A_LONDA_KEY",GetPCSpeaker());
        RewardXP("m2q4_Wererats",75,GetPCSpeaker());
        SetLocalInt(GetModule(),"Londa_Plot",100);
    }
}
