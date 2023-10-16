//::///////////////////////////////////////////////
//:: Serah's Caves Story
//:: act_ali_seracave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    the PC has heard the story of Serah's caves
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oDoor = GetObjectByTag("q1ab_at_q3ag");
    object oMap = GetObjectByTag("q1ab_mn_serahcave");
    SetMapPinEnabled(oMap,1);
    SetLocked(oDoor,FALSE);
    SetLocalInt(oPC,"os_serahcaves",10);
}
