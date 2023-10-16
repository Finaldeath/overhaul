//::///////////////////////////////////////////////
//:: Scrivener, Nav Point 1 (Condition Script)
//:: H2c_Scrv_Nav1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Scrivener is now looking
     for Nav Point 1 ("Treason").
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sNavPoint = GetLocalString(OBJECT_SELF, "sNavPoint");

    if (sNavPoint == "Treason")
    {
        return TRUE;
    }
    return FALSE;
}

