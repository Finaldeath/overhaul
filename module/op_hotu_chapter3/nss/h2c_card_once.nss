//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, Do Once (Condition Script)
//:: H2c_Card_Once.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the NPC has not spoken this
     line before.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bDoOnce = GetLocalInt(GetModule(), "bTalkedToArden");

    if (bDoOnce == FALSE)
    {
        SetLocalInt(GetModule(), "bTalkedToArden", TRUE);
        return TRUE;
    }
    return FALSE;
}
