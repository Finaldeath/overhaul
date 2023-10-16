//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Vix'thra is dead, Random 2 (Condition Script)
//:: Q3c_VixDead_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Vix'thra is dead and the
     Randomizer is set to 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bVixthraDead = GetLocalInt(GetModule(), "Q3_DRACOLICH_DEAD");
    int nRandom = GetLocalInt(OBJECT_SELF, "nRandom");

    if (bVixthraDead == TRUE &&
        nRandom == 2)
    {
        return TRUE;
    }
    return FALSE;
}
