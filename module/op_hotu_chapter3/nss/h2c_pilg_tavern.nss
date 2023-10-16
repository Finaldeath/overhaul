//::///////////////////////////////////////////////
//:: Githzerai Pilgrim, In Hellbreath Tavern (Condition Script)
//:: H2c_Pilg_Tavern.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the conversation is taking
     place inside the Hellbreath Tavern.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sArea = GetTag(oArea);

    if (sArea == "HellbreathTavern")
    {
        return TRUE;
    }
    return FALSE;
}

