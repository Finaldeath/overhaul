//::///////////////////////////////////////////////
//:: Ashtara the Asabi Merchant (Condition - State 3)
//:: C_Ashtara_3_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player has destroyed all the golems.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 25, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oGolem = GetObjectByTag("UndrentideGolem");

    if (oGolem == OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
