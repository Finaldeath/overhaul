//::///////////////////////////////////////////////
//:: Arden Swift, PC has learned his True Name (Condition Script)
//:: H2c_Arden_Named.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the PC
     Arden Swift's True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_ArdenNamed");
    if (bName == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
