//::///////////////////////////////////////////////
//:: Witchwork: Battlefield OnEnter
//:: WW_Enter_Battlef.nss
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
    if (GetIsPC(oEnterer) == TRUE &&
        GetIsDM(oEnterer) == FALSE)
    {
        //Inform DM of player movement
        DMInform(oEnterer);

        //Clear the map on the assumption that the player has already explored the
        //original.
        ExploreAreaForPlayer(OBJECT_SELF, oEnterer);

        //Make sure they and and their associates are no longer flagged as
        //invulnerable after death.
        object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oEnterer);
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oEnterer);
        object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oEnterer);

        SetPlotFlag(oEnterer, FALSE);
        SetPlotFlag(oHenchman, FALSE);
        SetPlotFlag(oFamiliar, FALSE);
        SetPlotFlag(oAnimalCompanion, FALSE);
    }
}
