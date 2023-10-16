//::///////////////////////////////////////////////
//:: Quarry Grinder, Imp Inside (Condition Script)
//:: H2c_Grind_Imp.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Lazy the Imp is still caught
     inside.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bImp = GetLocalInt(OBJECT_SELF, "bImpInGrinder");
    object oLazy = GetObjectByTag("H2_LazyBody");

    if (bImp == TRUE && GetIsObjectValid(oLazy))
    {
        return TRUE;
    }
    return FALSE;
}
