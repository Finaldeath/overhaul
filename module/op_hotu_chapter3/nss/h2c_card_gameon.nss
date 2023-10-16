//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, Game On (Condition Script)
//:: H2c_Card_GameOn.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the card game is currently
     active.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bGameOn = GetLocalInt(GetModule(), "bCardGameActive");
    if (bGameOn == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
