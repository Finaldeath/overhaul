//::///////////////////////////////////////////////
//:: The Knower of Names, Arden Swift Talked To (Condition Script)
//:: H7c_Name_Arden_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Arden Swift's been talked to.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bArden = GetLocalInt(GetModule(), "bTalkedToArden");
    int bTrueName = GetLocalInt(GetModule(), "bKnower_ArdenNamed");
    if (bArden == TRUE &&
        bTrueName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
