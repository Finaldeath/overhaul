//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed (post-death), OnUse
//:: WW1_Ahmed_OnUse.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Starts Ahmed's post-death conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 27, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();

    ActionStartConversation(oPC, "", TRUE);
}
