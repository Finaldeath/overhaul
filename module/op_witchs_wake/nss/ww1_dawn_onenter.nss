//::///////////////////////////////////////////////
//:: Witchwork 1: Dawn Area, OnEnter
//:: WW1_Dawn_OnEnter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Triggers the Ragpicker's Conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 1, 2002
//:://////////////////////////////////////////////
#include "ww_inc_subraces"

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

    //Return without doing anything if it's a DM
    if (GetIsDM(oEnterer) == TRUE)
    {
        return;
    }

    //ignore any entries made by NPCs or by players who have already experienced
    //the Ragpicker's conv
    int bRagpickerComplete = GetLocalInt(oEnterer, "CONV_RAGPICKER_End");
    if (GetIsPC(oEnterer) == TRUE &&
        bRagpickerComplete == FALSE)
    {
        //Set up the Subraces
        SetCommandable(TRUE, oEnterer);
        SetupSubraces(oEnterer);

        //Establish a long shot.
        DelayCommand(1.0, AssignCommand(oEnterer, SetCameraFacing(67.0, 25.0, 89.0)));

        //Spawn in a new clone.
        location lLoc = GetLocation(oEnterer);
        object oClone2 = GetLocalObject(oEnterer, "oCut2_Clone");

        //Make the clone lie down
        DelayCommand(1.0, AssignCommand(oClone2, PlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 5.0)));
        effect eFreeze = EffectCutsceneParalyze();
        DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eFreeze, oClone2));

        //Fade from black
        DelayCommand(3.0, FadeFromBlack(oEnterer, FADE_SPEED_SLOWEST));

        //Create Invisible Object to serve as speaker. Use store to determine location
        object oStore = GetObjectByTag("RagpickersStore");
        location lStore = GetLocation(oStore);
        object oRagpickerInvis = CreateObject(OBJECT_TYPE_PLACEABLE, "ragpickerinvis", lStore);

        //Save it as a local object on the player for future reference (area
        //heartbeat)
        SetLocalObject(oEnterer, "oRagpickerInvis", oRagpickerInvis);

        //Make the invisible placeable launch the ragpicker conversation
        DelayCommand(3.0, AssignCommand(oRagpickerInvis, ActionStartConversation(oEnterer, "", TRUE)));
    }
}
