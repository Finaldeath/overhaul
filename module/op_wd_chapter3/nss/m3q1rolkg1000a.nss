//::///////////////////////////////////////////////
//:: Reward for 3rd Bandit Head
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Sets Journal accordingly.
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   November 16 2001
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "M3Q3_A02OBOUL");
    object oWrit = GetItemPossessedBy(GetPCSpeaker(),"M3Q1A07WRIT");

     if (GetIsObjectValid(oItem) == TRUE)
     {
        DestroyObject(oItem);
     }
     if(GetIsObjectValid(oWrit) == TRUE)
     {
        DestroyObject(oWrit);
     }

    RewardGP(1000, GetPCSpeaker());
    RewardXP("M3Q1_A07_BANDIT_PLOT",50,GetPCSpeaker(),ALIGNMENT_NEUTRAL);
    // * call the script to take Obould's Head
    ExecuteScript("M3Q1ROLKTAKEOHEA",OBJECT_SELF);
}
