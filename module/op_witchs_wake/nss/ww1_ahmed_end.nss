//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed, Conversation End
//:: WW1_Ahmed_End.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Teleport the player to the next area, destroy
     the invisible conversation placeable, and
     return their camera mode to the default.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 27, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oClone = GetLocalObject(oPC, "oCut1_Clone");
    object oDestination = GetObjectByTag("WP_Awake");
    location lDestination = GetLocation(oDestination);
    object oAhmedConv = GetLocalObject(oPC, "oAhmedConversation");

    //Flag the player as having completed the conversation.
    SetLocalInt(oPC, "CONV_AHMED_End", TRUE);

    //Fade to black
    FadeToBlack(oPC, FADE_SPEED_MEDIUM);

    //Destroy the old clone.
    DestroyObject(oClone);

    //Create a new clone in the upcoming area.
    object oClone2 = CopyObject(oPC, lDestination);
    AssignCommand(oClone,ChangeToStandardFaction(oClone,STANDARD_FACTION_COMMONER));
    SetLocalObject(oPC, "oCut2_Clone", oClone2);

    //Teleport to new area.
    DelayCommand(2.0, AssignCommand(oPC, JumpToObject(oDestination)));

    //Destroy the invisible conversation placeable
    DestroyObject(oAhmedConv, 3.0);
}
