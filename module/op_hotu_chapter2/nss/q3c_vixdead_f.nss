//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Vix'thra is dead, 1st time talked to (Condition Script)
//:: Q3c_VixDead_F.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Vix'thra is dead and this is
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
    int bTalkedTo = GetLocalInt(OBJECT_SELF, "Q3_TalkedTo_VixDead");

    if (bVixthraDead == TRUE &&
        bArmandDead == FALSE &&
        bTalkedTo == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "Q3_TalkedTo_VixDead", TRUE);
        return TRUE;
    }
    return FALSE;
}

