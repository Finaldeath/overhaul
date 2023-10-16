//::///////////////////////////////////////////////
//:: Name con_q2dhal_tomi
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if Tomi is one of the PCs henchmen
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 15/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string szTomi = "x2_hen_tomi";
    string szTag1 = GetTag(GetHenchman(oPC, 1));
    string szTag2 = GetTag(GetHenchman(oPC, 2));
    if (szTomi == szTag1 || szTomi ==szTag2)
        return TRUE;
    return FALSE;
}
