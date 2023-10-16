//::///////////////////////////////////////////////
//:: Init the flagstone puzzle
//:: q2_puzzle_dr_op
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When player open the door to the puzzle room: init the beams by shooting a beam from
    the pedestal to every acid flagstone.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 6/2/2003
//:://////////////////////////////////////////////


void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_BEAMS_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_BEAMS_ONCE", 1);
    string sRayTargetTag = "Q2_ACID_RAY_TARGET";
    object oSource = GetObjectByTag("Q2_AMULET_PEDESTAL");
    effect eRay = EffectBeam(VFX_BEAM_EVIL, oSource, BODY_NODE_CHEST);
    int n = 1;
    object oTarget = GetNearestObjectByTag(sRayTargetTag, oSource);
    while(oTarget != OBJECT_INVALID && GetArea(oTarget) == GetArea(oSource))
    {
         ApplyEffectToObject(DURATION_TYPE_PERMANENT, eRay, oTarget);
         n++;
         oTarget = GetNearestObjectByTag(sRayTargetTag, oSource, n);
    }
}
