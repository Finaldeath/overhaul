//::///////////////////////////////////////////////
//:: Evil Act (Condition)
//:: C_EvilAct.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE only if the player is evil. Put
     in place at the request of WotC.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 4, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iAlign = GetAlignmentGoodEvil(oPC);
    if (iAlign == ALIGNMENT_EVIL)
    {
        return TRUE;
    }
    return FALSE;
}
