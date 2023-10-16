//::///////////////////////////////////////////////
//:: Perin Izrick's Conversation Script #1
//:: Perin01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Perin joins as a henchman. Unlocks the Inn
    Door so the plot can proceed. Sets the Main
    Plot state to 1.
*/
//:://////////////////////////////////////////////

void main()
{
    //Turn Perin into a henchman.
    //By default, Companions are assigned the Attack Nearest Enemy && Follow Master modes
    SetAssociateListenPatterns();
    SetLocalInt(OBJECT_SELF,"NW_COM_MODE_COMBAT",ASSOCIATE_COMMAND_ATTACKNEAREST);
    SetLocalInt(OBJECT_SELF,"NW_COM_MODE_MOVEMENT",ASSOCIATE_COMMAND_FOLLOWMASTER);
    AddHenchman(GetPCSpeaker());

    //Set Perin so he's no longer invulnerable.
    SetPlotFlag(OBJECT_SELF,FALSE);

    //Open the Inn Door
    object oInnDoor = GetObjectByTag("InnInterior");

    SetLocked(oInnDoor, FALSE);

    //Set the MainPlot State to 1
    SetLocalInt(GetModule(), "MainPlot", 1);
}
