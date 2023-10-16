//::///////////////////////////////////////////////
//:: Scrivener, Nav Point 3 (Condition Script)
//:: H2c_Scrv_Nav3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Scrivener is now looking
     for Nav Point 3 ("Infinity").
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sNavPoint = GetLocalString(OBJECT_SELF, "sNavPoint");

    if (sNavPoint == "Infinity")
    {
        return TRUE;
    }
    return FALSE;
}
