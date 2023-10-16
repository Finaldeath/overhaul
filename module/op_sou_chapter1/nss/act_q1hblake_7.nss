//::///////////////////////////////////////////////
//:: Name: act_q1hblake_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 //Have Adam follow the PC if he goes upstairs...
 //Set a variable that is checked in Walther's Heartbeat
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////


void main()
{
    object oBlake = GetObjectByTag("q1hblake");
    object oPC = GetPCSpeaker();
    ChangeToStandardFaction(oBlake, STANDARD_FACTION_DEFENDER);
    SetLocalInt(oBlake, "nFollow", 1);
    SetLocalObject(oBlake, "oLeader", oPC);
}
