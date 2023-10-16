// return mithril golems to thier posts
// and - remove all effects from mirrors and pillars (if the trap is not active)


void RemoveEffects2(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

void main()
{
    object oEnter = GetEnteringObject();

    if(GetTag(oEnter) == "q4d_mithril1" || GetTag(oEnter) == "q4d_mithril2")
    {
        effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oEnter));
        string sTag = "wp_" + GetTag(oEnter);
        object oWP = GetWaypointByTag(sTag);
        AssignCommand(oEnter, JumpToObject(oWP));
    }
    int nActive = GetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE");
    if(nActive == 1)
        return;

    object oMirror1 = GetObjectByTag("q4d_target1");
    object oMirror2 = GetObjectByTag("q4d_target2");
    object oMirror3 = GetObjectByTag("q4d_target3");
    object oMirror4 = GetObjectByTag("q4d_target4");
    object oPillar1 = GetObjectByTag("q4d_zap_source1");
    object oPillar2 = GetObjectByTag("q4d_zap_source2");

    RemoveEffects2(oMirror1);
    RemoveEffects2(oMirror2);
    RemoveEffects2(oMirror3);
    RemoveEffects2(oMirror4);
    RemoveEffects2(oPillar1);
    RemoveEffects2(oPillar2);
}
