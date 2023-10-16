//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag Multiplayer-Friendly (Action)
//:: WW1_Hag_Multi_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag her as having spoken this line. In
     multiplayer, this will help secondary players
     take a shortcut through her conversation,
     straight to her Tarot reading.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 19, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "bMultiplayerFriendlyNode", TRUE);
}
