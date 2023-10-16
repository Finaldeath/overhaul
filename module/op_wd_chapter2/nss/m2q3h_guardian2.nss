//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Condition Check #2
//:: m2q3H_Guardian2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script returns true if the Guardian has
    already been talked to and does not have the
    oaths of both brothers.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iTalkedTo = GetLocalInt(OBJECT_SELF, "TalkedTo");
    object oQuintOath = GetItemPossessedBy(OBJECT_SELF,"M2Q3_OATHQUINT");
    object oKarlatOath = GetItemPossessedBy(OBJECT_SELF,"M2Q3_OATHKARLAT");

    if (iTalkedTo == TRUE)
    {
        if (!GetIsObjectValid(oQuintOath) || !GetIsObjectValid(oKarlatOath))
        {
            return TRUE;
        }
    }
    return FALSE;
}
