//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, No Trumpet (Condition Script)
//:: H2c_Card_NoTrump.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the NPC no longer carries the
     Trumpet of Pandemonium.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oTrumpet = GetItemPossessedBy(OBJECT_SELF, "H2_Trumpet");

    if (oTrumpet == OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
