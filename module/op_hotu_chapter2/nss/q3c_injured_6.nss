//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Heavily Injured, Random 6 (Condition Script)
//:: Q3c_Injured_6.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is heavily injured
     and the Randomizer is set to 6.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int nMaxHP = GetMaxHitPoints(oPC);
    int nCurrentHP = GetCurrentHitPoints(oPC);
    int nPercentHP = nCurrentHP/nMaxHP*100;
    int nRandom = GetLocalInt(OBJECT_SELF, "nRandom");

    if (nPercentHP < 25 &&
        nRandom == 6)
    {
        return TRUE;
    }
    return FALSE;
}
