//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6TowerEnter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC is transported into the tower.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 9, 2001
//:://////////////////////////////////////////////

void main()
{
    object oClicker = GetPCSpeaker();
    object oTarget = GetTransitionTarget(OBJECT_SELF);
    location lLoc = GetLocation(oTarget);

    SetLocalInt(OBJECT_SELF,"NW_L_TowerOpen",10);
    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

    AssignCommand(oClicker,JumpToLocation(lLoc));
}
