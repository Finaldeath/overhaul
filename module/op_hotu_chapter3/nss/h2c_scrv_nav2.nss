//::///////////////////////////////////////////////
//:: Scrivener, Nav Point 2 (Condition Script)
//:: H2c_Scrv_Nav2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Scrivener is now looking
     for Nav Point 2 ("Dimension").
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sNavPoint = GetLocalString(OBJECT_SELF, "sNavPoint");

    if (sNavPoint == "Dimension")
    {
        return TRUE;
    }
    return FALSE;
}
