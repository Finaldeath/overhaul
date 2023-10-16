//::///////////////////////////////////////////////
//:: act_suc_useheals
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC uses a healing spell
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetFirstPC();
    object oSuc = GetObjectByTag("q3_dying");
    ActionPauseConversation();
    AssignCommand(oPC,ActionCastFakeSpellAtObject(SPELL_CURE_LIGHT_WOUNDS,oSuc));
    effect eVis = EffectVisualEffect(VFX_IMP_HEALING_S);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oSuc);
    ActionResumeConversation();
}
