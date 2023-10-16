// Shattered Mirror shard:
// When used on a pillar - activate the pillar's power, and disable the pillar for a few rounds.

float PILLAR_CHARGE_TIME = 30.0;
int TRAP_DUR = 5;
#include "X0_I0_SPELLS"
#include "nw_i0_generic"
#include "x2_inc_spellhook"

void StripEffects(int nNumber, object oTarget);
void AdjustCopy(object oCopy);
void DestroyCopy(object oCopy);
void CreateFence(location lLoc);
void SetBlocker(object oCreature);

void main()
{
    object oPC = GetLocalObject(GetArea(OBJECT_SELF), "CURRENT_SHARD_USER");
    object oTarget;
    if(oPC != OBJECT_INVALID && GetTag(oPC) == "q6_sabal") // if sabal is the one using the shard
    {
        // init the var
        SetLocalObject(GetArea(OBJECT_SELF), "CURRENT_SHARD_USER", OBJECT_INVALID);
        oTarget = GetLocalObject(GetArea(OBJECT_SELF), "CURRENT_SHARD_TARGET");
        SetLocalObject(GetArea(OBJECT_SELF), "CURRENT_SHARD_TARGET", OBJECT_INVALID);
    }
    else
    {
        oPC = GetItemActivator();
        oTarget = GetItemActivatedTarget();
    }


    string sTag = GetTag(oTarget);
    if(GetStringLeft(sTag, 11) != "q6f2_Pillar")
        return;

    // pillar's type is in it's tag and determine's it's special power.
    int nType = StringToInt(GetStringRight(sTag, 1));


    // making sure the pillar is active
    int nActive = GetLocalInt(oTarget, "ACTIVE");
    if(nActive == 1)
        return;
    SetLocalInt(oTarget, "ACTIVE", 1);
    DelayCommand(PILLAR_CHARGE_TIME, SetLocalInt(oTarget, "ACTIVE", 0));

    // Apply a charged visual effect to pillar and start removing the effects
    // until the pillar is discharged and ready for use again
    effect eEff = GetFirstEffect(oTarget);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oTarget, eEff);
        eEff = GetNextEffect(oTarget);
    }
    effect eBeam = EffectBeam(VFX_BEAM_ODD, oPC, BODY_NODE_HAND);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, 1.5);

    effect eImp = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eImp, oTarget);
    effect eVis = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
    effect eVis2 = EffectVisualEffect(VFX_DUR_BLUR);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget, PILLAR_CHARGE_TIME);
    DelayCommand(PILLAR_CHARGE_TIME,
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis2, oTarget));

    // Activate pillars power, depending on it's type

    if(nType == 1) // Revive
    {
        // Heal all allies
        effect eVis = EffectVisualEffect(VFX_IMP_HEALING_X);
        effect eHeal = EffectHeal(100);
        effect eLink = EffectLinkEffects(eVis, eHeal);
        int i = 1;
        float fDelay = 1.0;
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oPC));
        object oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, oPC, i);
        while(oCreature != OBJECT_INVALID)
        {
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oCreature));
            fDelay += 1.0;
            i++;
            oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, oPC, i);
        }
    }
    else if(nType == 2) // Dispel
    {
        // Mord' Disjunction on all enemies
        int i = 1;
        float fDelay = 1.0;
        object oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC, i);
        while(oCreature != OBJECT_INVALID)
        {
            DelayCommand(fDelay, StripEffects(6, oCreature));
            fDelay += 1.0;
            i++;
            oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC, i);
        }
    }
    else if(nType == 3) // Entrapment
    {
        // jumping enemies into a trapped area.

        // First removing everyone from the trap areas:

        object oWP;
        int i;
        object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oTarget, i);
        while(oCreature != OBJECT_INVALID)
        {
            if(GetLocalInt(oCreature, "Q6F_INSIDE") == 1)
            {
                oWP = GetNearestObjectByTag("q6f_wp_trap_exit", oCreature);
                DelayCommand(0.5, AssignCommand(oCreature, JumpToObject(oWP)));
                DelayCommand(3.0, AssignCommand(oCreature, DetermineCombatRound(oPC)));
            }
            i++;
            oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oTarget, i);
        }

        // Create the fence
        i = 1;
        //object oFence;
        oWP = GetNearestObjectByTag("q6f_wp_fence", oTarget, i);
        while(oWP != OBJECT_INVALID)
        {
            CreateFence(GetLocation(oWP));
            i++;
            oWP = GetNearestObjectByTag("q6f_wp_fence", oTarget, i);
        }

        // bring in the blades...
        i = 1;
        oWP = GetNearestObjectByTag("q6f_wp_blades", oTarget, i);
        effect eBlades = EffectAreaOfEffect(AOE_PER_WALLBLADE, "q6f_s0_bladebara", "q6f_s0_bladebarc");
        while(oWP != OBJECT_INVALID)
        {
            DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eBlades, GetLocation(oWP), RoundsToSeconds(TRAP_DUR)));
            i++;
            oWP = GetNearestObjectByTag("q6f_wp_blades", oTarget, i);
        }
        // bring in the victims

        i = 1;
        object oBlock; // setting the nearest cage on the creature so he would attack it.
        oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC, i);
        oWP = GetNearestObjectByTag("q6f_wp_trap_catch", oPC, i);
        while(oCreature != OBJECT_INVALID && i <= 4)
        {
            if(GetMaster(oCreature) == OBJECT_INVALID)
            {
                DelayCommand(1.5, AssignCommand(oCreature, JumpToObject(oWP)));
                DelayCommand(2.0, SetBlocker(oCreature));
                SetLocalString(oCreature,"X2_SPECIAL_COMBAT_AI_SCRIPT", "q6f_ai_blocked");
                i++;
                oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC, i);
                oWP = GetNearestObjectByTag("q6f_wp_trap_catch", oPC, i);
            }
        }

    }
    else if(nType == 4) // Guardian
    {
        // polymorph into a golem for a few rounds
        effect ePoly = EffectPolymorph(93);
        effect eAttackBonus = EffectAttackIncrease(10, ATTACK_BONUS_MISC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAttackBonus, oPC, RoundsToSeconds(3));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePoly, oPC, RoundsToSeconds(3));
    }
    else if(nType == 5) // Time
    {
        // haste all allies and slow all enemies
        effect eHaste = EffectHaste();
        effect eSlow = EffectSlow();
        effect eImpHaste = EffectVisualEffect(VFX_IMP_HASTE);
        effect eImpSlow = EffectVisualEffect(VFX_IMP_SLOW);
        int i = 1;
        object oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC, i);
        while(oCreature != OBJECT_INVALID)
        {
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eImpSlow, oCreature));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSlow, oCreature, RoundsToSeconds(5)));
            i++;
            oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC, i);
        }

        i = 1;
        oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, oPC, i);
        while(oCreature != OBJECT_INVALID)
        {
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eImpHaste, oCreature));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHaste, oCreature, RoundsToSeconds(5)));
            i++;
            oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, oPC, i);
        }



    }
    else if(nType == 6) // Mirroring
    {
        effect eVis = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oPC));
        // creates 3 decoy copies of the player for a few rounds
        object oCopy1 = CopyObject(oPC, GetLocation(oPC));
        object oCopy2 = CopyObject(oPC, GetLocation(oPC));
        object oCopy3 = CopyObject(oPC, GetLocation(oPC));

        // Making sure the copies are not too powerful
        AdjustCopy(oCopy1);
        AdjustCopy(oCopy2);
        AdjustCopy(oCopy3);

        DelayCommand(RoundsToSeconds(5), DestroyCopy(oCopy1));
        DelayCommand(RoundsToSeconds(5), DestroyCopy(oCopy2));
        DelayCommand(RoundsToSeconds(5), DestroyCopy(oCopy3));
    }

}

void AdjustCopy(object oCopy)
{
    // set hit points to a max of 50
    // set AC to 25
    // set base attack bonus to 20
    // set number of attack to 2
    // set all object's item as non-dropable

    ChangeFaction(oCopy, GetFirstPC());

    int nHP = GetCurrentHitPoints(oCopy);
    int nHPChange = nHP - 50;
    if(nHPChange > 0)
    {
        effect eDamage = EffectDamage(nHPChange);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oCopy);
    }
    int nAC = GetAC(oCopy);
    int nACChange = nAC - 25;
    if(nACChange > 0)
    {
        effect eACDec = EffectACDecrease(nACChange);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eACDec, oCopy);
    }
    int nAttBon = GetBaseAttackBonus(oCopy);
    int nAttBonChange = 20 - nAttBon;
    if(nAttBonChange > 0)
    {
        effect eAttDec = EffectAttackDecrease(nAttBonChange);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eAttDec, oCopy);
    }
    SetBaseAttackBonus(2, oCopy);
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, GetFirstPC());
    AssignCommand(oCopy, ActionMoveAwayFromObject(GetFirstPC(), TRUE, 10.0));
    AssignCommand(oCopy, ActionAttack(oEnemy));

    object oItem = GetFirstItemInInventory(oCopy);
    while(oItem != OBJECT_INVALID)
    {
        SetDroppableFlag(oItem, FALSE);
        oItem = GetNextItemInInventory(oCopy);
    }
    oItem = GetItemInSlot(INVENTORY_SLOT_ARMS, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_ARROWS, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_BELT, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_BOLTS, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_BOOTS, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_BULLETS, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_CLOAK, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_NECK, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oCopy);
    SetDroppableFlag(oItem, FALSE);
    oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oCopy);
    SetDroppableFlag(oItem, FALSE);

    TakeGoldFromCreature(GetGold(oCopy), oCopy, TRUE);
}


void StripEffects(int nNumber, object oTarget)
{
    //Declare major variables
    effect eVis = EffectVisualEffect(VFX_IMP_BREACH);
    int nCnt = 0;
    int nIdx = 0;
    int nTotal = nNumber;
    if(GetIsEnemy(oTarget))
    {
        //Search through and remove protections.
        while(nCnt <= 17 && nIdx < nTotal)
        {
            nIdx = nIdx + RemoveProtections(GetSpellBreachProtection(nCnt), oTarget, nCnt);
            nCnt++;
        }
    }
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
}

void DestroyCopy(object oCopy)
{
    effect eVis = EffectVisualEffect(VFX_IMP_DESTRUCTION);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oCopy));
    DestroyObject(oCopy);
}

void CreateFence(location lLoc)
{
    object oFence = CreateObject(OBJECT_TYPE_PLACEABLE, "q6f_fence", lLoc);
    DestroyObject(oFence, RoundsToSeconds(TRAP_DUR));

}

void SetBlocker(object oCreature)
{
    AssignCommand(oCreature, ClearAllActions());
    object oBlocker = GetNearestObjectByTag("q6f_fence", oCreature);
    SetLocalObject(oCreature, "Q6F_BLOCKER", oBlocker);
    AssignCommand(oCreature, DetermineCombatRound());
}
