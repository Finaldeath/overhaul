//::///////////////////////////////////////////////
//:: Mephistopheles, Good Aribeth Present (Condition Script)
//:: H9c_Meph_Ari_G1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Good Aribeth is in the area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetNearestObjectByTag("H2_Aribeth");
    int iAlignment = GetAlignmentGoodEvil(oAribeth);
    if (oAribeth != OBJECT_INVALID &&
        iAlignment == ALIGNMENT_GOOD)
    {
        //Flag them as having been present for the battle.
        SetLocalInt(GetModule(), "bAribethEndBattle", TRUE);
        return TRUE;
    }
    return FALSE;
}
