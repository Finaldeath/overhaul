//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Vix'thra & Armand are Dead, Random 3 (Condition Script)
//:: Q3c_VixArmDead_3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if both Vix'thra and Armand are
     dead and the Randomizer is set to 3.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArmand = GetObjectByTag("q3_armand");
    int bVixthraDead = GetLocalInt(GetModule(), "Q3_DRACOLICH_DEAD");
    int bArmandDead = GetIsDead(oArmand);
    int nRandom = GetLocalInt(OBJECT_SELF, "nRandom");

    if (bVixthraDead == TRUE &&
        bArmandDead == TRUE &&
        nRandom == 3)
    {
        return TRUE;
    }
    return FALSE;
}
