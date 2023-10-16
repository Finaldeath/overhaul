//::///////////////////////////////////////////////
//:: Name act_q2d4door_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has correctly identified the pattern
    and the door will open
    Reward also given for picking the doors lock
    seeing as it is so complex
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    effect eBurst = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBurst, GetLocation(OBJECT_SELF));
    object oDoor = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    SetLocked(oDoor, FALSE);
    ActionOpenDoor(oDoor);

    //Reward experience if this was the first attempt
    if (GetLocalInt(OBJECT_SELF, "nAttempts") < 2)
    {
        Reward_2daXP(oPC, XP_LOW, FALSE);
    }
}
