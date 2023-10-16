//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 pause conversation and have the PC
perform a casting animation while
playing the 'bardsong' sound
(basically a fake use of the bard's song ability)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 24/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    ActionPauseConversation();
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 4.0));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_BARD_SONG), oPC, 4.0);
    DelayCommand(4.5, ActionResumeConversation());


}
