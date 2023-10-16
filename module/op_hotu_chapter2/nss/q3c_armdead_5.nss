//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Armand is dead, Random 5 (Condition Script)
//:: Q3c_ArmDead_5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Armand is dead and the
     Randomizer is set to 5.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bArmandDead = GetLocalInt(GetModule(), "bArmandKilled");
    int nRandom = GetLocalInt(OBJECT_SELF, "nRandom");

    if (bArmandDead == 1 &&
        nRandom == 5)
    {
        return TRUE;
    }
    return FALSE;
}
