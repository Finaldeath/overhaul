//::///////////////////////////////////////////////
//:: Name hod_fail_door
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Hall of Doors - On fail to open of one of the
    doors - speak a one liner conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Dec 6/02
//:://////////////////////////////////////////////

void main()
{
    //SpeakOneLinerConversation();
    BeginConversation("con_hod_door2", GetEnteringObject());
}
