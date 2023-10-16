//::///////////////////////////////////////////////
//:: Sleeping Man, Will Save vs Discern Lies (Condition Script)
//:: H3c_SMan_WillSav.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player makes their Will
     Save vs the Sleeping Man's Discern Lies
     ability (DC 19).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bSave = WillSave(oPC, 19, SAVING_THROW_TYPE_DIVINE);

    if (bSave == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
