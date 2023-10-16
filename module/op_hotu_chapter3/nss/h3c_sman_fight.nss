//::///////////////////////////////////////////////
//:: Sleeping Man, PC forces him to fight the Sensei (Condition Script)
//:: H3c_SMan_Fight.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the PC
     the Sleeping Man's True Name.
     Evil restriction added later at WotC's
     request.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_SleepingManNamed");
    object oPC = GetPCSpeaker();
    int iAlign = GetAlignmentGoodEvil(oPC);
    if (bName == TRUE &&
        iAlign == ALIGNMENT_EVIL)
    {
        return TRUE;
    }
    return FALSE;
}
