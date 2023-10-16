//::///////////////////////////////////////////////
//:: FileName:x0_d1_didchaotny
//:://////////////////////////////////////////////
/*
Use to adjust the PC's alignment to evil a tiny bit
*/
//:://////////////////////////////////////////////
//:: Created By: Naomi Novik
//:: Created On: /2002
//:://////////////////////////////////////////////

void main()
{
    AdjustAlignment(GetPCSpeaker(), ALIGNMENT_CHAOTIC, 1);
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
    AssignCommand(GetPCSpeaker(), ActionPauseConversation());
    AssignCommand(GetPCSpeaker(), ActionCastFakeSpellAtObject(SPELL_LIGHT, OBJECT_SELF));
    DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(GetPCSpeaker())));
    DelayCommand(3.0, ActionResumeConversation());
}
