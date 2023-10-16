//::///////////////////////////////////////////////
//:: Quarry Grinder, Repair Attempt (Condition Script)
//:: H2c_Grind_RepAtt.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not already
     attempted to Repair the grinder previously.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bAttempt = GetLocalInt(OBJECT_SELF, "bRepairAttempted");

    if (bAttempt == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}

