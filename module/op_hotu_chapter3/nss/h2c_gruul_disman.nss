//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Quarry Grinder 4 Dismantled (Condition Script)
//:: H2c_Gruul_Disman.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player has dismantled Quarry
     Grinder 5.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oGrinder5 = GetObjectByTag("QuarryGrinder5");
    int bDismantled = GetLocalInt(oGrinder5, "bDismantled");

    if (bDismantled == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
