//::///////////////////////////////////////////////
//:: PC Opens Door
//:: act_hsl_opendoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC opens the door to the slave cage
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("q3ag_door_cage");
    object oPC = GetFirstPC();
    SetLocked(oDoor,FALSE);
    AssignCommand(oPC,ActionOpenDoor(oDoor));
}
