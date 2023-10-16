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
    object oPC = GetPCSpeaker();
    effect eVis = EffectVisualEffect(VFX_FNF_LOS_HOLY_30);
    AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 1);
    AssignCommand(oPC, ActionPauseConversation());
    AssignCommand(oPC, ActionCastFakeSpellAtObject(SPELL_BLESS, oPC));
    DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(GetPCSpeaker())));
    DelayCommand(3.0, AssignCommand(oPC, ActionResumeConversation()));
}
