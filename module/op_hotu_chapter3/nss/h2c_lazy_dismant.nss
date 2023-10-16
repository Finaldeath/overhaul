//::///////////////////////////////////////////////
//:: Lazy the Imp, Dismantle Attempt (Condition Script)
//:: H2c_Lazy_Dismant.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Lazy is still caught in
     Quarry Grinder 5 and player has not already
     attempted to dismantle the grinder previously
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oGrinder = GetObjectByTag("QuarryGrinder5");
    int bImp = GetLocalInt(oGrinder, "bImpInGrinder");
    int bAttempt = GetLocalInt(oGrinder, "bDismantleAttempted");

    if (bImp == TRUE &&
        bAttempt == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
