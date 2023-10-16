//::///////////////////////////////////////////////
//:: Ashtara the Asabi Merchant (Condition - State 4)
//:: C_Ashtara_3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player has already talked to Ashtara after
     destroying all the golems.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 24, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bPostPlot = GetLocalInt(OBJECT_SELF, "bPostPlot");

    if (bPostPlot == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
