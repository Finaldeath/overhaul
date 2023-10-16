// Trap trigger on-enter:
// Activate the trap if it is not active now.

#include "nw_i0_plot"

int MAX_CHARGES = 20; // at the last charge - zap the player
int SAVE_DC = 28;

void RemoveEffects2(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

// Removes visual effect from mirrors
void UnsetMirrors()
{
    int i;
    string sTag;
    object oObject;
    for(i = 1; i <= 4; i++)
    {
        sTag = "q4d_target" + IntToString(i);
        oObject = GetObjectByTag(sTag);
        RemoveEffects2(oObject);
        SetLocalInt(oObject, "DEACTIVATED", 0);
        effect eHeal = EffectHeal(10000);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oObject);
        SetPlotFlag(oObject, FALSE);
    }
}

// Mirrors start humming with energy
void SetMirrors()
{
    int i;
    string sTag;
    object oObject;
    effect eVis = EffectVisualEffect(VFX_DUR_PARALYZED);
    for(i = 1; i <= 4; i++)
    {
        sTag = "q4d_target" + IntToString(i);
        oObject = GetObjectByTag(sTag);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oObject);
    }
}

// Removes the beams
void ClearBlock()
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE") != 0)
    {
        if(GetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE") == 1)
            SetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE", 0);
        UnsetMirrors();
        int i;
        string sTag;
        object oObject;
        for(i = 1; i <= 8; i++)
        {
            sTag = "q4d_block" + IntToString(i);
            oObject = GetObjectByTag(sTag);
            RemoveEffects2(oObject);
        }
    }
}

// trap triggers after the charge
void Zap()
{
    object oPillar1 = GetObjectByTag("q4d_zap_source1");
    object oPillar2 = GetObjectByTag("q4d_zap_source2");
    if(GetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE") == 1)
    {
        int nFortSave;
        effect eJumpVis = EffectVisualEffect(VFX_FNF_PWSTUN);
        effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
        object oWPJump = GetObjectByTag("q4d_wp_trap_reject");
        effect eElectricImp = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
        effect eSonicImp = EffectVisualEffect(VFX_IMP_SONIC);
        effect eLink1;
        effect eLink2;
        effect eBeam1 = EffectBeam(VFX_BEAM_LIGHTNING, oPillar1, BODY_NODE_CHEST);
        effect eBeam2 = EffectBeam(VFX_BEAM_LIGHTNING, oPillar2, BODY_NODE_CHEST);
        object oPC = GetLocalObject(OBJECT_SELF, "MASTER_PC");
        int nElectricDamage = d6(25);
        int nSonicDamage = d6(25);
        nElectricDamage = GetReflexAdjustedDamage(nElectricDamage, oPC, SAVE_DC, SAVING_THROW_TYPE_ELECTRICITY);
        nFortSave = FortitudeSave(oPC, SAVE_DC, SAVING_THROW_TYPE_SONIC);
        if(nFortSave == 1)
            nSonicDamage /= 2;
        else if(nFortSave == 2)
            nSonicDamage = 0;
        effect eElectricDamage = EffectDamage(nElectricDamage, DAMAGE_TYPE_ELECTRICAL);
        effect eSonicDamage = EffectDamage(nSonicDamage, DAMAGE_TYPE_SONIC);
        eLink1 = EffectLinkEffects(eElectricDamage, eElectricImp);
        eLink2 = EffectLinkEffects(eSonicDamage, eSonicImp);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam1, oPC, 1.2);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam2, oPC, 1.2);
        if(nElectricDamage > 0)
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oPC);
        if(nSonicDamage > 0)
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink2, oPC);
        DelayCommand(1.8, AssignCommand(oPC, JumpToObject(oWPJump)));
        DelayCommand(1.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, eJumpVis, oPC));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eShake, oPC);
        AssignCommand(oPC, PlaySound("as_wt_thundercl2"));

        object oLastCreature = oPC;
        object oCreature = GetFirstObjectInArea(GetArea(OBJECT_SELF));
        while(oCreature != OBJECT_INVALID)
        {
            if(GetObjectType(oCreature) == OBJECT_TYPE_CREATURE &&
                GetLocalInt(oCreature, "Q4D_IN_TRAP") == 1
                && oCreature != oPC)
            {
                eBeam1 = EffectBeam(VFX_BEAM_LIGHTNING, oLastCreature, BODY_NODE_CHEST);
                eBeam2 = EffectBeam(VFX_BEAM_LIGHTNING, oLastCreature, BODY_NODE_CHEST);
                nElectricDamage = GetReflexAdjustedDamage(nElectricDamage, oCreature, SAVE_DC, SAVING_THROW_TYPE_ELECTRICITY);
                nFortSave = FortitudeSave(oCreature, SAVE_DC, SAVING_THROW_TYPE_SONIC);
                if(nFortSave == 1)
                    nSonicDamage /= 2;
                else if(nFortSave == 2)
                    nSonicDamage = 0;
                effect eElectricDamage = EffectDamage(nElectricDamage, DAMAGE_TYPE_ELECTRICAL);
                effect eSonicDamage = EffectDamage(nSonicDamage, DAMAGE_TYPE_SONIC);
                eLink1 = EffectLinkEffects(eElectricDamage, eElectricImp);
                eLink2 = EffectLinkEffects(eSonicDamage, eSonicImp);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam1, oCreature, 1.2);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam2, oCreature, 1.2);
                if(nElectricDamage > 0)
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oCreature);
                if(nSonicDamage > 0)
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink2, oCreature);
                DelayCommand(1.8, AssignCommand(oCreature, JumpToObject(oWPJump)));
                DelayCommand(1.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, eJumpVis, oCreature));
                oLastCreature = oCreature;
            }
            oCreature = GetNextObjectInArea(GetArea(OBJECT_SELF));
        }


        // Handling all other creatures inside

    }
}

// Checks to see if the trap is still active before applying the next charge
void ApplyCharge(location lLoc, float fDur, int nChargeNum)
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE") == 1)
    {
        if(GetLocalInt(GetArea(OBJECT_SELF), "TRAP_COUNT") == 4) // player shot all 4 targets
        {
            ClearBlock();
            SetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE", 2); // trap disabled
            // some visual effects
            object oPillar1 = GetObjectByTag("q4d_pillar1");
            object oPillar2 = GetObjectByTag("q4d_pillar2");
            effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPillar1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPillar2);
            DelayCommand(1.0, RemoveEffects2(oPillar1));
            DelayCommand(1.0, RemoveEffects2(oPillar2));
            object oDoor = GetObjectByTag("q4d_door1");
            SetLocked(oDoor, FALSE);
            AssignCommand(oDoor, ActionOpenDoor(oDoor));
            Reward_2daXP(GetFirstPC(), 34);

        }
        else
        {
            effect eVis = EffectVisualEffect(VFX_DUR_SPELLTURNING);
            object oSource = CreateObject(OBJECT_TYPE_PLACEABLE, "q4d_chargesource", lLoc);
            DestroyObject(oSource, fDur);
            //ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, lLoc, fDur);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oSource, fDur);
        }
    }
}

// Show visual effect of charging pillar and zap player at the end
void ActivatePillar(object oPillar)
{
    int i;
    float fDelayJump = 1.2;
    float fDelay = 0.0;
    float fVerticalJupm = 0.4;
    vector vPos = GetPosition(oPillar);
    location lLoc;
    float fTotalDur;
    for(i = 1; i <= MAX_CHARGES; i++)
    {
        lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
        fTotalDur = (20 - i) * fDelayJump;
        DelayCommand(fDelay, ApplyCharge(lLoc, fTotalDur, i));
        fDelay += fDelayJump;
        vPos.z += fVerticalJupm;
    }
    if(GetTag(oPillar) == "q4d_pillar1") // so it would be done only once for the two pillars
    {
        DelayCommand(fDelay, Zap());
        DelayCommand(fDelay + 0.5, ClearBlock());
        DelayCommand(fDelay + 1.8, SetLocalInt(GetArea(OBJECT_SELF), "TRAP_COUNT", 0));
    }

    // Fire beams to mirros:
    object oTarget1;
    object oTarget2;
    if(GetTag(oPillar) == "q4d_pillar1")
    {
        oTarget1 = GetNearestObjectByTag("q4d_target1");
        oTarget2 = GetNearestObjectByTag("q4d_target2");
    }
    else
    {
        oTarget1 = GetNearestObjectByTag("q4d_target3");
        oTarget2 = GetNearestObjectByTag("q4d_target4");
    }
    effect eBeam = EffectBeam(VFX_BEAM_LIGHTNING, oPillar, BODY_NODE_CHEST);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam, oTarget1);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam, oTarget2);
}

void Activate()
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE") != 2)
        SetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE", 1);

    // Creating the beams effect around the platform
    effect eBeam;
    int i;
    string sSourceTag;
    string sTargetTag;
    object oSource;
    object oTarget;
    int nTargetNum;
    for(i = 1; i <= 8; i++)
    {
        sSourceTag = "q4d_block" + IntToString(i);
        if(i == 8)
            nTargetNum = 1;
        else
            nTargetNum = i + 1;
        sTargetTag = "q4d_block" + IntToString(nTargetNum);
        oSource = GetObjectByTag(sSourceTag);
        oTarget = GetObjectByTag(sTargetTag);
        eBeam = EffectBeam(VFX_BEAM_ODD, oSource, BODY_NODE_CHEST);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam, oTarget);

    }

    // Activate the pillars
    object oPillar1 = GetObjectByTag("q4d_pillar1");
    object oPillar2 = GetObjectByTag("q4d_pillar2");
    SetMirrors();
    ActivatePillar(oPillar1);
    ActivatePillar(oPillar2);

}

void main()
{
    object oPC = GetEnteringObject();
    SetLocalInt(oPC, "Q4D_IN_TRAP", 1);
    int nActive = GetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE");
    if(nActive != 0 || !GetIsPC(oPC))
        return;
    SetLocalObject(OBJECT_SELF, "MASTER_PC", oPC); // this object would be the first to be hit by the trap
    DelayCommand(0.5, Activate());
}

