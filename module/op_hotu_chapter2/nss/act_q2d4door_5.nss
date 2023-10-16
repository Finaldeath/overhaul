//::///////////////////////////////////////////////
//:: Name: act_q2d4door_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Open the Door...No xp reward since this was
    done with a skill check...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////


void main()
{
    effect eBurst = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBurst, GetLocation(OBJECT_SELF));
    object oDoor = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    SetLocked(oDoor, FALSE);
    ActionOpenDoor(oDoor);

}

