//::///////////////////////////////////////////////
//:: Ashtara the Asabi Merchant (Condition - State 3)
//:: C_Ashtara_3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player has destroyed all the golems. DoOnce
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 24, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oGolem = GetObjectByTag("UndrentideGolem");
    int bPostPlot = GetLocalInt(OBJECT_SELF, "bPostPlot");

    if (oGolem == OBJECT_INVALID &&
        bPostPlot == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
