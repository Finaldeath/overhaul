//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker Crouch
//:: WW1_Ragp_Crouch.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make the Ragpicker crouch and face the PC.
     Make sure she doesn't break out of
     conversation with anyone else.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oRagpicker = GetNearestObjectByTag("Ragpicker");
    location lPC = GetLocation(oPC);
    vector vPC = GetPositionFromLocation(lPC);

    AssignCommand(oRagpicker, ActionPauseConversation());
    AssignCommand(oRagpicker, SetFacingPoint(vPC));
    AssignCommand(oRagpicker, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 5.0));
    AssignCommand(oRagpicker, ActionResumeConversation());
}
