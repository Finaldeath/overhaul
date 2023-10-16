//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6GolemTask2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The golem goes on the task to kill the Overwizard
    of the South.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_M2Q6GolemEnergy",GetLocalInt(OBJECT_SELF,"NW_L_M2Q6GolemEnergy") - 1000);
    SetLocalInt(OBJECT_SELF,"NW_L_Task",2);
}
