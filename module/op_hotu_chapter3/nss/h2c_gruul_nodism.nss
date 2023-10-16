//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Quarry Grinder 4 Not Dismantled (Condition Script)
//:: H2c_Gruul_NoDism.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player has not dismantled
     Quarry Grinder 5.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oGrinder5 = GetObjectByTag("QuarryGrinder5");
    int bDismantled = GetLocalInt(oGrinder5, "bDismantled");

    if (bDismantled == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
