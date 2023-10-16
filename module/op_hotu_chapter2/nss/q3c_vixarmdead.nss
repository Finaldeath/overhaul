//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Vix'thra & Armand are Dead (Condition Script)
//:: Q3c_VixArmDead.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if both Vix'thra and Armand are
     dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 24, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArmand = GetObjectByTag("q3_armand");
    int bVixthraDead = GetLocalInt(GetModule(), "Q3_DRACOLICH_DEAD");
    int bArmandDead = GetIsDead(oArmand);

    if (bVixthraDead == TRUE &&
        bArmandDead == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

