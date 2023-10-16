//::///////////////////////////////////////////////
//:: PC Unlocks door
//:: q2c24b_prsunlock
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The player unlocks the prisoner's cell
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetNearestObjectByTag("q2c24b_door_pris");
    object oPC = GetFirstPC();
    SetLocked(oDoor,FALSE);
    SetLocalInt(OBJECT_SELF,"Q2C24B_PRISON_UNLOCKED",1);
    ActionPauseConversation();
    AssignCommand(oPC,ActionOpenDoor(oDoor));
    ActionResumeConversation();
}
