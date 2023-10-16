//::///////////////////////////////////////////////
//:: The Knower of Names, Deekin in Module (Condition Script)
//:: H7c_Name_Deeki_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Deekin has been
     transferred over from Chapter 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    int bTrueName = GetLocalInt(GetModule(), "bKnower_DeekinNamed");
    if (oDeekin != OBJECT_INVALID &&
        bTrueName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
