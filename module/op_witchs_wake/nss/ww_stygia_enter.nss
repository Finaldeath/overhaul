//::///////////////////////////////////////////////
//:: Witchwork: Stygia OnEnter
//:: WW_Stygia_Enter.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sends a 'Game Over' message to anyone that
     enters Stygia.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2002
//:://////////////////////////////////////////////

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

    string sStygia1 = "Having tasted death too many times, your soul slips through the Plane of Sorrows and into the hells of Stygia.";
    string sStygia2 = "You may remain there to battle the Stygian hordes but, for the purposes of this module, your game is over.";

    //Send Server message to player, informing them that their game is
    //over
    SendMessageToPC(oEnterer, sStygia1);
    SendMessageToPC(oEnterer, sStygia2);
}
