//::///////////////////////////////////////////////
//:: Name con_q2dhal_dael
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if Daelan is one of the PCs henchmen
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 15/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string szHench = "x2_hen_daelan";
    string szTag1 = GetTag(GetHenchman(oPC, 1));
    string szTag2 = GetTag(GetHenchman(oPC, 2));
    if (szHench == szTag1 || szHench == szTag2)
        return TRUE;
    return FALSE;
}
