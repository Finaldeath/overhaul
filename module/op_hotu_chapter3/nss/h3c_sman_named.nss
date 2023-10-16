//::///////////////////////////////////////////////
//:: Sleeping Man, PC has learned his True Name (Condition Script)
//:: H3c_SMan_Named.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the PC
     the Sleeping Man's True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_SleepingManNamed");
    if (bName == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
