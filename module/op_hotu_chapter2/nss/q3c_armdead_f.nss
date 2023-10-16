//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Armand is dead, 1st time talked to (Condition Script)
//:: Q3c_ArmDead_F.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Armand is dead and this is
     the first time the player has talked to this
     character.
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
    int bTalkedTo = GetLocalInt(OBJECT_SELF, "Q3_TalkedTo_ArmDead");

    if (bVixthraDead == FALSE &&
        bArmandDead == TRUE &&
        bTalkedTo == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "Q3_TalkedTo_ArmDead", TRUE);
        return TRUE;
    }
    return FALSE;
}

