//::///////////////////////////////////////////////
//:: Created 1 Golem Already
//:: 2q6e_nogolems
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If a golem has been created already
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nPlot = GetLocalInt(OBJECT_SELF, "NW_2Q6E_CONTROL_ROD");
    if(nPlot == 100)
    {
        return TRUE;
    }
    return FALSE;
}
