// if a valid spell have been cast on it:
// 1. Play visual effect and disable the conduit so it would reject future spells
// 2. Store the spell ID as a module var to be used when the golem is spawned.
// 3. Create the golem when the 4th conduit has a valid spell cast on it.
// 4. Create the amulet on the player.

#include "nw_i0_plot"

// return TRUE if this spell has already been stored, FALSE otherwise
int GotSpell(int nSpell)
{
    return GetLocalInt(GetArea(OBJECT_SELF), "STORED_SPELL" + IntToString(nSpell)) == 1;
}

void StoreSpell(int nSpell, object oPC)
{
    SetLocalInt(GetArea(OBJECT_SELF), "STORED_SPELL" + IntToString(nSpell), 1);
    int nCurrentSlot = GetLocalInt(GetArea(OBJECT_SELF), "CURRENT_GOLEM_SLOT");
    SetLocalInt(GetModule(), "Q4D_GOLEM_SLOT" + IntToString(nCurrentSlot), nSpell);
    nCurrentSlot++;
    SetLocalInt(GetArea(OBJECT_SELF), "CURRENT_GOLEM_SLOT", nCurrentSlot);
    if(nCurrentSlot == 4) // all slots are full - create the golem
    {
        object oAmulet = CreateItemOnObject("q4d_GolemAmulet2", oPC);
        ExecuteScript("q4d_golemamulet2", oPC);
        Reward_2daXP(oPC, 37);
    }
}

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
    int nSpell = GetLocalInt(OBJECT_SELF, "CURRENT_SPELL");
    object oTable = GetNearestObjectByTag("q4d_golem_machine");
    SetLocked(oTable, TRUE);
    object oPC = GetLocalObject(OBJECT_SELF, "PC");
    float fDelay = 3.0;
    if(GetHasSpell(nSpell, oPC))
    {
        AssignCommand(oPC, ActionCastFakeSpellAtObject(nSpell, OBJECT_SELF));
        DecrementRemainingSpellUses(oPC, nSpell);
    }
    else
    {
        AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_READ));
        AssignCommand(oPC, ActionCastFakeSpellAtObject(nSpell, OBJECT_SELF));
        object oScroll = GetLocalObject(OBJECT_SELF, "CURRENT_SPELL_SCROLL");
        DestroyObject(oScroll);
        fDelay += 2.0;
    }

    if(!GotSpell(nSpell) &&
        GetLocalInt(OBJECT_SELF, "STORED") == 0)
        {
            SetLocalInt(OBJECT_SELF, "STORED", 1);
            RemoveEffects2(OBJECT_SELF);
            effect eImp = EffectVisualEffect(VFX_IMP_MAGBLUE);
            effect eVis = EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE);
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eImp, OBJECT_SELF));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF));
            DelayCommand(fDelay + 0.5, StoreSpell(nSpell, oPC));
        }
}
