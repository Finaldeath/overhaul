//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Condition Check #3
//:: m2q3H_Guardian3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script returns true if the Guardian has
    already been talked to and already has the
    oaths of both brothers.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iTalkedTo = GetLocalInt(OBJECT_SELF, "TalkedTo");
    int iQuintOath = GetLocalInt(OBJECT_SELF, "QuintOath");
    int iKarlatOath = GetLocalInt(OBJECT_SELF, "KarlatOath");

    if (iTalkedTo == TRUE)
    {
        if (iQuintOath == TRUE && iKarlatOath == TRUE)
        {
            return TRUE;
        }
    }
    return FALSE;
}

