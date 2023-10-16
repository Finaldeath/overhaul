//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Rumor: The Lottery (Condition Script)
//:: Q3c_Rumor_Lotter.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has learned that
     the villagers hold some form of Lottery and
     both Vix'thra and Armand are still alive.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 24, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bRumor = GetLocalInt(oPC, "Q3_Rumor_Lottery");
    int bVixthraDead = GetLocalInt(GetModule(), "Q3_DRACOLICH_DEAD");
    object oArmand = GetObjectByTag("q3_armand");
    int bArmandDead = GetIsDead(oArmand);

    if (bRumor == TRUE &&
        bVixthraDead == FALSE &&
        bArmandDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
