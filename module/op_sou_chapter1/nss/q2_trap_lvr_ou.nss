//::///////////////////////////////////////////////
//:: Re-activate kobold-room trap
//:: q2_trap_lvr_ou
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mark the global var as triggered, so when the player uses the pressure plate on the room - the trap is triggered
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 6/2/2003
//:://////////////////////////////////////////////


void main()
{
    SetLocalInt(GetArea(OBJECT_SELF), "Q2_KOBOLD_TRAP_TRIGGERED", 1);
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
}
