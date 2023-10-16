//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker Abort Conversation
//:: WW1_Ragp_Abort.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player aborts conversation before
    reaching the end of the Ragpicker's initial
    conversation, relaunch it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int bEnd = GetLocalInt(oPC, "CONV_RAGPICKER_End");

    while (GetCommandable(OBJECT_SELF) == FALSE)
    {
        SetCommandable(TRUE);
    }

    if (bEnd == FALSE)
    {
        ActionStartConversation(oPC, "", TRUE);
    }
}
