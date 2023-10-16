//::///////////////////////////////////////////////
//:: Name  act_q2dhalas_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Halaster casts his geas spell on the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 15/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    ActionPauseConversation();
    ActionCastFakeSpellAtObject(SPELL_MAGE_ARMOR, oPC);
    effect eVis = EffectVisualEffect(VFX_IMP_DOMINATE_S);
    effect eGlow = EffectVisualEffect(294);
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eGlow, oPC));
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eGlow, oPC));
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eGlow, oPC));
    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eGlow, oPC));
    DelayCommand(1.0, ActionResumeConversation());

}
