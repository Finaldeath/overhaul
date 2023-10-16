//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Store Not Avaliable Post-Names (Condition Script)
//:: H2c_Gruul_NoStor.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player hasn't gained
     access to Gru'ul's store previously and
     hasn't yet used his True Name to command him
     to open it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 7, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bStore = GetLocalInt(OBJECT_SELF, "bStoreViewed");
    if (bStore == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}

