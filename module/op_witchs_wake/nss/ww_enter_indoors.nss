//::///////////////////////////////////////////////
//:: Witchwork: Area OnEnter (Generic Indoors)
//:: WW_Enter_Indoors.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Send a message to any DMs, informing them of
     the player's new location.

     Handle the SEI Subraces.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 23, 2002
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
}
