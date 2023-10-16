//::///////////////////////////////////////////////
//:: Ashtara the Asabi Merchant (Condition - State 1)
//:: C_Ashtara_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player has not yet received the key to leave
     camp.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 24, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bGaveKey = GetLocalInt(OBJECT_SELF, "bGaveKey");

    if (bGaveKey == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
