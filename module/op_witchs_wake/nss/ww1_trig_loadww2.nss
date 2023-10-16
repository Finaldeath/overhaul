//::///////////////////////////////////////////////
//:: Witch Wake 1: Trigger, Launch Witch Wake 2
//:: WW1_Trig_LoadWW2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Launches the conversation that will give the
     player the opportunity to jump to WW2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oGhost = GetNearestObjectByTag("ww1_mineghost");
    object oPC = GetEnteringObject();

    //if the ghost hasn't been spawned in yet (or if the enterer isn't a PC),
    //do nothing.
    if (oGhost != OBJECT_INVALID &&
        GetIsPC(oPC) == TRUE)
    {
        //Clear the player's actions.
        AssignCommand(oPC, ClearAllActions(TRUE));

        //Launch the ghost's conversation.
        AssignCommand(oGhost, ActionStartConversation(oPC));

        //Make the PC Uncommandable.
        SetCommandable(FALSE, oPC);
    }
}
