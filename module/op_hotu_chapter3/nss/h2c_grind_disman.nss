//::///////////////////////////////////////////////
//:: Quarry Grinder, Dismantled (Condition Script)
//:: H2c_Grind_Disman.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Grinder has been
     dismantled.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bDismantled = GetLocalInt(OBJECT_SELF, "bDismantled");

    if (bDismantled == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
