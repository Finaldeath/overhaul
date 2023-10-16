//::///////////////////////////////////////////////
//:: m2q3E Mary O'Deel Condition Script #1
//:: m2q3E_MaryC1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if she's already been talked to.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 13, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iTalkedTo = GetLocalInt(OBJECT_SELF, "TalkedTo");

    if (iTalkedTo == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
