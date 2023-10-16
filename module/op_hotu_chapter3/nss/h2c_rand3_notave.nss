//::///////////////////////////////////////////////
//:: Quarry Plot, Random 3, Not In Hellbreath Tavern (Condition Script)
//:: H2c_Rand3_NoTave.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if a previously saved random
     integer equals 3 and the conversation is
     taking place outside the Hellbreath Tavern.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRandom = GetLocalInt(OBJECT_SELF, "iRandom");
    object oArea = GetArea(OBJECT_SELF);
    string sArea = GetTag(oArea);

    if (/*iRandom == 3 &&*/
        sArea != "HellbreathTavern")
    {
        return TRUE;
    }
    return FALSE;
}

