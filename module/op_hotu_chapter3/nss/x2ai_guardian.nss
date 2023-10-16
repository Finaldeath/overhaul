// Shield Guardian golem custom AI

#include "nw_i0_generic"
#include "NW_I0_SPELLS"

void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF,"X2_NW_I0_GENERIC_INTRUDER");
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);
    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();

    int nSpell;
    int nTarget;
    object oTarget;

    int i = 1;
    for(i = 1; i <= 3; i++)
    {
        nSpell = GetLocalInt(GetModule(), "X2_GOLEM_SPELL_SLOT" + IntToString(i));
        nTarget = GetLocalInt(GetModule(), "X2_GOLEM_SPELL_SLOT_TARGET_TYPE" + IntToString(i));
        oTarget = oIntruder;
        if(nTarget == 1) // target self
            oTarget = OBJECT_SELF;
        if(nSpell != 0)
        {
            ActionCastSpellAtObject(nSpell, oTarget, METAMAGIC_ANY, TRUE);
            ActionDoCommand(SetLocalInt(GetModule(), "X2_GOLEM_SPELL_SLOT" + IntToString(i), 0));
            return;
        }
    }


    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 0);
    ActionAttack(oIntruder);
}
