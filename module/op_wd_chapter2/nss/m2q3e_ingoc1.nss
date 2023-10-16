//::///////////////////////////////////////////////
//:: m2q3E Ingo Condition Script #1
//:: m2q3E_IngoC1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if Erik's fetch plot is resolved.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 13, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iErik = GetLocalInt(GetModule(), "m2q3E_ErikQuestComplete");

    if (iErik == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
