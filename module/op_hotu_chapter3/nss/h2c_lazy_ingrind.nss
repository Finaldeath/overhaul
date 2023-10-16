//::///////////////////////////////////////////////
//:: Lazy the Imp, Still in Grinder (Condition Script)
//:: H2c_Lazy_InGrinder.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE is Lazy is still caught in
     Quarry Grinder 5
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oGrinder = GetObjectByTag("QuarryGrinder5");
    int bImp = GetLocalInt(oGrinder, "bImpInGrinder");

    if (bImp == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
