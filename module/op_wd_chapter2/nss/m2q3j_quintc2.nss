//::///////////////////////////////////////////////
//:: m2q3J Quint Condition Script #2
//:: m2q3J_QuintC2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is carrying
    Quint's Journal.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetItemPossessedBy(oPC, "M2Q3J_JOURNQuint") != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}

