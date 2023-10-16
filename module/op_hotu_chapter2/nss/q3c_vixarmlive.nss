//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Vix'thra & Armand are Alive (Condition Script)
//:: Q3c_VixArmLive.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if both Vix'thra and Armand are
     alive.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 25, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArmand = GetObjectByTag("q3_armand");
    int bVixthraDead = GetLocalInt(GetModule(), "Q3_DRACOLICH_DEAD");
    int bArmandDead = GetIsDead(oArmand);

    if (bVixthraDead == FALSE &&
        bArmandDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
