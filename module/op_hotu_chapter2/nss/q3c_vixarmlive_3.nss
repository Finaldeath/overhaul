//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Vix'thra & Armand are Alive, Random 3 (Condition Script)
//:: Q3c_VixArmLive_3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if both Vix'thra and Armand are
     alive and the Randomizer is set to 3.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bVixthraDead = GetLocalInt(GetModule(), "Q3_DRACOLICH_DEAD");
    int bArmandDead = GetLocalInt(GetModule(), "bArmandKilled");
    int nRandom = GetLocalInt(OBJECT_SELF, "nRandom");

    if (bVixthraDead == FALSE &&
        bArmandDead == 0 &&
        nRandom == 3)
    {
        return TRUE;
    }
    return FALSE;
}
