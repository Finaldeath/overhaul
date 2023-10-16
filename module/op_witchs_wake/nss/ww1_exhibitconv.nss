//::///////////////////////////////////////////////
//:: Witchwork 1: Guild Exhibit, Start Conversation
//:: WW1_ExhibitConv.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     To address name-wrapping issues in the
     conversation GUI, have the actual exhibit
     conversations held by a "Guild Exhibit"
     invisible placeable
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 1, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    object oExhibit = GetNearestObjectByTag("GuildExhibit");
    string sTag = GetTag(OBJECT_SELF);

    AssignCommand(oExhibit, ActionStartConversation(oPC, sTag));
}
