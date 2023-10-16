//::///////////////////////////////////////////////
//:: Spirit of the Dead, Inside (Condition Script)
//:: H2c_Ghost_Inside.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the conversation is taking
     place inside either the Hellbreath Tavern or
     the Quarry Office.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 1, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sArea = GetTag(oArea);

    if (sArea == "HellbreathTavern" ||
        sArea == "IceQuarry")
    {
        return TRUE;
    }
    return FALSE;
}
