//::///////////////////////////////////////////////
//:: Githzerai Sensei, Second Time Talked To (Condition Script)
//:: H2c_Sens_Talked.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has spoken with
     the NPC before but hasn't yet completed the
     Five-Fold Mysteries of the Sleeping Man.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bTalked = GetLocalInt(OBJECT_SELF, "bTalked");
    int bComplete = GetLocalInt(GetModule(), "bMysteriesComplete");

    if (bTalked == TRUE &&
        bComplete == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
