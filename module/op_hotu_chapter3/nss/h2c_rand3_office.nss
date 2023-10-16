//::///////////////////////////////////////////////
//:: Quarry Plot, Random 3, In Quarry Office (Condition Script)
//:: H2c_Rand3_Office.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if a previously saved random
     integer equals 3 and the conversation is
     taking place inside the Quarry Office area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRandom = GetLocalInt(OBJECT_SELF, "iRandom");
    object oArea = GetArea(OBJECT_SELF);
    string sArea = GetTag(oArea);

    if (/*iRandom == 3 &&*/
        sArea == "QuarryOffice")
    {
        return TRUE;
    }
    return FALSE;
}

