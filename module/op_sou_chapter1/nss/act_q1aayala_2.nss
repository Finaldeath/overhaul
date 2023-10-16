//::///////////////////////////////////////////////
//:: Name  act_q1aayala_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Attempt to cast cure poison on Drogan
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();
    //Mark this conversation node as done
    SetLocalInt(GetModule(), "nAyalaCast", 1);
    ActionCastFakeSpellAtObject(SPELL_HEAL, GetObjectByTag("Drogan"));
    DelayCommand(3.1, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_L), GetLocation(GetObjectByTag("Drogan"))));
    DelayCommand(4.0, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0));
    DelayCommand(6.5, ActionResumeConversation());


}
