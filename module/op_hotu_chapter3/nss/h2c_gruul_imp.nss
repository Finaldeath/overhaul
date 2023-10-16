//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Gru'ul Knows An Imp's in his Grinder (Condition Script)
//:: H2c_Gruul_Imp.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has already told
     Gru'ul there's an imp in his grinder.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 28, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oGrinder5 = GetObjectByTag("QuarryGrinder5");
    int bDismantled = GetLocalInt(oGrinder5, "bDismantled");
    int bImp = GetLocalInt(GetModule(), "bGruulKnowsImpInGrinder");
    if (bImp == TRUE &&
        bDismantled == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
