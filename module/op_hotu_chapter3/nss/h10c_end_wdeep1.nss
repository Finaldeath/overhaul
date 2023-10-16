//::///////////////////////////////////////////////
//:: End Narration, Waterdeep become Capital of Hell (Condition Script)
//:: H10c_End_Wdeep1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player allowed the Prime
     Material to slip into Baator
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
        sFate == "HellServant" ||
        (iAlignment == ALIGNMENT_EVIL && sPlayerChoice == "Replace"))
    {
        return TRUE;
    }
    return FALSE;
}
