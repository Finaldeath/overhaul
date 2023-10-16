//::///////////////////////////////////////////////
//:: Aribeth, Combat 1-Liner #2 (Condition Script)
//:: H2c_Ari_Combat2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE as a combat one-liner but will
     only be said once.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 15, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    // Brad Prince - added combat check so these shouts only occur in combat.
    if(!GetIsObjectValid(GetPCSpeaker()) && GetIsInCombat())
    {
        //DoOnce
        int bDoOnce = GetLocalInt(OBJECT_SELF, "bCombatLine2");
        int bSurrendered = GetLocalInt(OBJECT_SELF, "Generic_Surrender");
        if (bDoOnce == FALSE &&
            bSurrendered == FALSE)
        {
            SetLocalInt(OBJECT_SELF, "bCombatLine2", TRUE);
            return TRUE;
        }
    }
    return FALSE;
}


