//::///////////////////////////////////////////////
//:: End Narration, Cania Ruled by PC (Condition Script)
//:: H10c_End_Cania3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player rules Cania,
     either alone or with Mephistopheles.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iAlignment = GetAlignmentGoodEvil(oPC);
    string sPlayerChoice = GetLocalString(GetModule(), "sPCEndChoice");
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    if (sFate == "Co-Ruler" ||
        sFate == "HellServant" /*||
        (iAlignment == ALIGNMENT_EVIL && sPlayerChoice == "Replace")*/)
    {
        return TRUE;
    }
    return FALSE;
}
