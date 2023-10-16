//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Condition Check #1
//:: m2q3H_Guardian1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script returns true if the Guardian has
    not yet been talked to.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iTalkedTo = GetLocalInt(OBJECT_SELF, "TalkedTo");

    if (iTalkedTo == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
