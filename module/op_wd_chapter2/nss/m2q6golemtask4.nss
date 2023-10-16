//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6GolemTask4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The golem goes on the task to patrol the corridors.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_M2Q6GolemEnergy",GetLocalInt(OBJECT_SELF,"NW_L_M2Q6GolemEnergy") - 750);
    SetLocalInt(OBJECT_SELF,"NW_L_Task",4);
}
