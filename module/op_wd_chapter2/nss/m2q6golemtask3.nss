//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6GolemTask3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The golem goes on the task to open the prison
    cells.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_M2Q6GolemEnergy",GetLocalInt(OBJECT_SELF,"NW_L_M2Q6GolemEnergy") - 500);
    SetLocalInt(OBJECT_SELF,"NW_L_Task",3);
    SignalEvent(OBJECT_SELF,EventUserDefined(601));
}
