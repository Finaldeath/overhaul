//::///////////////////////////////////////////////
//:: Name q2a_at_wellroom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Do not allow the PC to leave the well room after
    the fight has started down here until after the
    PC has talked with Durnan (post-beholder)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 13/03
//:://////////////////////////////////////////////

void main()
{
    object oClicker = GetClickingObject();
    //this variable is set in 'q2awell_enter' and then changed with the first node of Durnan's post beholder dialog
    if (GetLocalInt(GetModule(), "X2_Q2AWellRoomFight") == 1)
        FloatingTextStrRefOnCreature(85674, oClicker);
    else
    {
        object oTarget = GetTransitionTarget(OBJECT_SELF);

        SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

        AssignCommand(oClicker,JumpToObject(oTarget));
    }
}
