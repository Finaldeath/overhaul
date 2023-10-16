//::///////////////////////////////////////////////
//:: The Knower of Names, Aribeth's Name's Been Carved (Condition Script)
//:: H7c_Name_Ari_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player knows Aribeth's
     name (not TRUE NAME).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bAribethsNameKnown");
    int bTrueName = GetLocalInt(GetModule(), "bKnower_AribethNamed");
    if (bName == TRUE &&
        bTrueName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
