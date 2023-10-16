//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed Abort Conversation
//:: WW1_Ahmed_Abort.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If the player aborts Ahmed's conversation
     while he's still alive, relaunch it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(OBJECT_SELF);
    string sArea = GetTag(oArea);

    if(sArea != "PlayerAwakes")
    {
        ActionStartConversation(oPC, "", TRUE);
        AssignCommand(oPC, ClearAllActions());
    }
}
