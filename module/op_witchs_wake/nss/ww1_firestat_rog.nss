//::///////////////////////////////////////////////
//:: Witch Wake 1: Fire Statue, PC is Rogue
//:: WW1_FireStat_Rog.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is a Rogue (and
     therefore able to make a Use Magic Device
     check).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bRogue = GetLevelByClass(CLASS_TYPE_ROGUE, oPC);

    if (bRogue > 0)
    {
        return TRUE;
    }
    return FALSE;
}
