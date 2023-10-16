//::///////////////////////////////////////////////
//:: Applies a Wild Magic Effect to PC Triggerer
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: December
//:://////////////////////////////////////////////

// * return nearest wild magic object
object WildMage()
{
  return GetNearestObjectByTag("M3WILDMAGICCAST");
}

void DoFireShieldOn(object oPC)
{
//    AssignCommand(oPC,SpeakString("fireshield"));
    AssignCommand(WildMage(), ActionCastSpellAtObject(SPELL_ELEMENTAL_SHIELD, GetEnteringObject(), METAMAGIC_ANY, TRUE));
}

void DoLightningOn(object oPC)
{
//    AssignCommand(oPC,SpeakString("lightning"));
    AssignCommand(WildMage(), ActionCastSpellAtObject(SPELL_CHAIN_LIGHTNING, oPC, METAMAGIC_ANY, TRUE));
}

void DoCureOn(object oPC)
{
//    AssignCommand(oPC,SpeakString("cure"));
    AssignCommand(WildMage(), ActionCastSpellAtObject(SPELL_CURE_MODERATE_WOUNDS, oPC, METAMAGIC_ANY, TRUE));
}

void DoNegativeOn(object oPC)
{
//    SpeakString("DEBUGnegative levels not implemented yet");
//    AssignCommand(oPC,SpeakString("negative"));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY), oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectNegativeLevel(1), oPC, 100.0);
}

void DoHeroOn(object oPC)
{
//   AssignCommand(oPC,SpeakString("hero"));
   float fDuration = 24.0;
    effect eBonus = EffectAbilityIncrease(ABILITY_STRENGTH, 4);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBonus, oPC, fDuration);
    eBonus = EffectACIncrease(4);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBonus, oPC, fDuration);
    effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
}
void DoFireOn(object oPC)
{
//    AssignCommand(oPC,SpeakString("fire"));
    AssignCommand(WildMage(), ActionCastSpellAtObject(SPELL_FLAME_STRIKE, oPC, METAMAGIC_ANY, TRUE));
}

void main()
{
    object oPC = GetEnteringObject();
    // * exit if entering object is invalid
    if (GetIsObjectValid(oPC) == FALSE)
    {
        return;
    }
    if (GetIsPC(oPC) == TRUE)
    {
        int nRandom = Random(6) + 1;
        switch (nRandom)
        {
            case 1: DoFireShieldOn(oPC);
            break;
            case 2: DoLightningOn(oPC);
            break;
            case 3: DoCureOn(oPC);
            break;
            case 4: DoNegativeOn(oPC);
            break;
            case 5: DoHeroOn(oPC);
            break;
            case 6: DoFireOn(oPC);
            break;
        }
    }
}
