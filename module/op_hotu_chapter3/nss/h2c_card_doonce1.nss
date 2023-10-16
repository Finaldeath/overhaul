//::///////////////////////////////////////////////
//:: Arden Swift, Do Once 1 (Condition Script)
//:: H2c_Card_DoOnce1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Don't let the player choose this multiple
     times.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bGaveWinnings");
    if (bDoOnce == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
