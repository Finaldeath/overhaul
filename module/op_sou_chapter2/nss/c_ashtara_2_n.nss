//::///////////////////////////////////////////////
//:: Ashtara the Asabi Merchant (Condition - State 2)
//:: C_Ashtara_2_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player has received the scarab key but has
     not yet destroyed all the golems.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 25, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bGaveKey = GetLocalInt(OBJECT_SELF, "bGaveKey");
    object oGolem = GetObjectByTag("UndrentideGolem");

    if (bGaveKey == TRUE &&
        oGolem != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
