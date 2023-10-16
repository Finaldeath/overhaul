//::///////////////////////////////////////////////
//:: Name act_q2bnymph1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Nymph charms the PC

    she walks to the pc
have charm effect go off
pc falls unconscious
fade to black
fade from black
she is gone, so is half the pc's gold

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: June 22/03
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetPCSpeaker();
    object oNymph = OBJECT_SELF;

    effect eCharm = EffectVisualEffect(VFX_IMP_CHARM);
    effect eKnockdown = EffectKnockdown();

    AssignCommand(oNymph, ActionMoveToObject(oPC));
    DelayCommand(0.5, PlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 1.5));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eCharm, oPC));
    DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oPC, 6.0));
    DelayCommand(2.0, FadeToBlack(oPC, FADE_SPEED_FAST));
    DestroyObject(oNymph, 5.2);

    int nGold = GetGold(oPC)/2;
    DelayCommand(5.0, TakeGoldFromCreature(nGold, oPC, TRUE));
    DelayCommand(5.0, FadeFromBlack(oPC, FADE_SPEED_MEDIUM));
}
