//::///////////////////////////////////////////////
//:: Witchwork: Steinfaar Mines OnEnter
//:: WW_Enter_Mines.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Send a message to any DMs, informing them of
     the player's new location.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 23, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void DMInform(object oEnterer)
{
    //Only track player movement.
    if (GetIsPC(oEnterer) == TRUE)
    {
        string sCharName = GetName(oEnterer);
        string sPlayerName = GetPCPlayerName(oEnterer);
        string sAreaName = GetName(OBJECT_SELF);
        string sAreaTag = GetTag(OBJECT_SELF);

        //Build and send message...
        SendMessageToAllDMs(sCharName+" ("+sPlayerName+") has entered "+
                            sAreaName+" ("+sAreaTag+").");
    }
}

void main()
{
    object oEnterer = GetEnteringObject();

    //Inform DM of player movement
    DMInform(oEnterer);

    //Handle journal entries.
    AddJournalQuestEntry("WW_SteinfaarMines", 10, oEnterer, FALSE);
    AddJournalQuestEntry("WW_CavanaughStone", 30, oEnterer, FALSE);

    //Flag them as having entered (referenced in the Night Hag's PoS Conv)
    SetLocalInt(oEnterer, "WW1_EnteredMines", TRUE);
}
