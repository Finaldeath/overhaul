//::///////////////////////////////////////////////
//:: Name con_q2dhal_shar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if Sharwyn is one of the PCs henchmen
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 15/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string szHench = "x2_hen_sharwyn";
    string szTag1 = GetTag(GetHenchman(oPC, 1));
    string szTag2 = GetTag(GetHenchman(oPC, 2));
    if (szHench == szTag1 || szHench == szTag2)
        return TRUE;
    return FALSE;
}
