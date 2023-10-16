// Drow attack

#include "nw_i0_generic"

void RemoveEffects(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

void Fight(object oDrow)
{
    object oPC = GetFirstPC();
    RemoveEffects(oDrow);
    AdjustReputation(oDrow, oPC, -100);
    AdjustReputation(oPC, oDrow, -100);
    AssignCommand(oDrow, DetermineCombatRound());

}

void BringSpec()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    object oSP = GetNearestObjectByTag("q5a_wp_darkness", oPC);
    CreateObject(OBJECT_TYPE_CREATURE, "q5_spec", GetLocation(oSP), TRUE);
}

void main()
{
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_FIGHT_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_FIGHT_ONCE", 1);

    object oEldath;
    if(GetTag(OBJECT_SELF) != "q5a_eldath")
        oEldath = GetNearestObjectByTag("q5a_eldath");
    else
        oEldath = OBJECT_SELF;

    DelayCommand(0.5, Fight(oEldath));

    float fDelay = 0.5;
    int i = 1;
    object oWizard = GetNearestObjectByTag("q5_drow_wizard", OBJECT_SELF, i);
    while(oWizard != OBJECT_INVALID)
    {
        DelayCommand(fDelay, Fight(oWizard));
        i++;
        oWizard = GetNearestObjectByTag("q5_drow_wizard", OBJECT_SELF, i);
        fDelay += 0.5;
    }

    i = 1;
    object oWarrior = GetNearestObjectByTag("q5_drow_warrior", OBJECT_SELF, i);
    while(oWarrior != OBJECT_INVALID)
    {
        DelayCommand(fDelay, Fight(oWarrior));
        i++;
        oWarrior = GetNearestObjectByTag("q5_drow_warrior", OBJECT_SELF, i);
        fDelay += 0.5;
    }

    i = 1;
    /*object oDark = GetNearestObjectByTag("q5a_wp_darkness", OBJECT_SELF, i);

    while(oDark != OBJECT_INVALID)
    {
        ActionCastSpellAtObject(SPELL_DARKNESS, oDark, METAMAGIC_ANY, TRUE, 0,
            PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        i++;
        oDark = GetNearestObjectByTag("q5a_wp_darkness", OBJECT_SELF, i);
    }*/

    //DelayCommand(6.0, BringSpec());
}
