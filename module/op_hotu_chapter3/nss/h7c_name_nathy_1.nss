//::///////////////////////////////////////////////
//:: The Knower of Names, Nathyrra in Module (Condition Script)
//:: H7c_Name_Nathy_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Nathyrra has been
     transferred over from Chapter 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    int bTrueName = GetLocalInt(GetModule(), "bKnower_NathyrraNamed");
    if (oNathyrra != OBJECT_INVALID &&
        bTrueName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
