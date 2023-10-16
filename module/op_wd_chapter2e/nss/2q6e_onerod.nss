//::///////////////////////////////////////////////
//:: Check for a single rod
//:: 2q5e_onerod
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if one and only one rod is present
    in the chamber.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nRod = GetLocalInt(OBJECT_SELF, "NW_2Q6E_REPLICATION_ROD");
    int nControl = GetLocalInt(OBJECT_SELF, "NW_2Q6E_CONTROL_ROD");

    if(nRod == FALSE && nControl == TRUE)
    {
        return TRUE;
    }
    else if(nRod == TRUE && nControl == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
