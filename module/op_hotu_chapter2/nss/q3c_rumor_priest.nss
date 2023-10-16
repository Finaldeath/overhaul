//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Rumor: Priests Are Scary (Condition Script)
//:: Q3c_Rumor_Priest.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has learned that
     the villagers are scared of the priests and
     High Priest Armand is still alive.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bRumor = GetLocalInt(oPC, "Q3_Rumor_Priests");
    object oArmand = GetObjectByTag("q3_armand");
    int bArmandDead = GetIsDead(oArmand);

    if (bRumor == TRUE &&
        bArmandDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
