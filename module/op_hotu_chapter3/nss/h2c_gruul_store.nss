//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Store Avaliable Post-Names (Condition Script)
//:: H2c_Gruul_Store.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player gained access to
     Gru'ul's store previously or has used his
     True Name to command him to open it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bStore = GetLocalInt(OBJECT_SELF, "bStoreViewed");
    if (bStore == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
