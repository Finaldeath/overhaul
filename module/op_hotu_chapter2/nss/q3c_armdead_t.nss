//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Armand is dead, 2nd time talked to (Condition Script)
//:: Q3c_ArmDead_T.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Armand is dead and this is
     not the first time the player has talked to
     this character.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 24, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oVixthra = GetObjectByTag("q3_vixthra");
    object oArmand = GetObjectByTag("q3_armand");
    int bVixthraDead = GetIsDead(oVixthra);
    int bArmandDead = GetIsDead(oArmand);
    int bTalkedTo = GetLocalInt(OBJECT_SELF, "Q3_TalkedTo_ArmDead");

    if (bVixthraDead == FALSE &&
        bArmandDead == TRUE &&
        bTalkedTo == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

