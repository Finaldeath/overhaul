//::///////////////////////////////////////////////
//:: The Knower of Names, Valen in Module (Condition Script)
//:: H7c_Name_Valen_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Valen has been
     transferred over from Chapter 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oValen = GetObjectByTag("x2_hen_valen");
    int bTrueName = GetLocalInt(GetModule(), "bKnower_ValenNamed");
    if (oValen != OBJECT_INVALID &&
        bTrueName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
