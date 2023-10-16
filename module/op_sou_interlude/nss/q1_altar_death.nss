// On-death event for altar in stinger caves:
// - Destroy all beam effects.
// - Destroy 2 obelisks
// - Destroy all remianing Ghouls and award 50XP for each remaining Ghoul.

void RemoveEffects(object oObject)
{
    effect eEffect = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oObject, eEffect);
        eEffect = GetNextEffect(oObject);
    }
}

void main()
{
    object oZidan = GetObjectByTag("Q1_ZIDAN");
    object oAltar = GetObjectByTag("Q1_ALTAR");
    object oTop1 = GetObjectByTag("Q1_TOP1");
    object oTop2 = GetObjectByTag("Q1_TOP2");
    object oObelisk1 = GetObjectByTag("Q1_OBELISK1");
    object oObelisk2 = GetObjectByTag("Q1_OBELISK2");
    object oSource = GetNearestObjectByTag("Q1_BEAM_SOURCE");

    // remove all beams
    RemoveEffects(oAltar);
    RemoveEffects(oTop1);
    RemoveEffects(oTop2);
    RemoveEffects(oSource);
    RemoveEffects(oZidan);

    // destroy pillars and beam source
    DestroyObject(oSource);
    effect eDam = EffectDamage(1000);
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oObelisk1));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oObelisk2));
    int i = 1;
    int nAward = 0;
    // destroy Ghouls
    object oGhoul = GetNearestObjectByTag("Q1_GHOUL", GetLastKiller(), i);
    while(oGhoul != OBJECT_INVALID)
    {
        i++;
        if(GetIsDead(oGhoul))
        {
            oGhoul = GetNearestObjectByTag("Q1_GHOUL", GetLastKiller(), i);
            continue;
        }
        nAward += 50;
        effect eVis = EffectVisualEffect(VFX_IMP_DESTRUCTION);
        effect eLink = EffectLinkEffects(eDam, eVis);
        DelayCommand(2.0, DestroyObject(oGhoul));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oGhoul);
        oGhoul = GetNearestObjectByTag("Q1_GHOUL", GetLastKiller(), i);
    }
    // set a variable on the module that the altar has been destroyed
    SetLocalInt(GetModule(), "q1_Altar_Destroyed", 1);

    // award XP
    if(nAward == 0)
        return;
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        GiveXPToCreature(oPC, nAward);
        oPC = GetNextPC();
    }

}
