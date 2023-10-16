//::///////////////////////////////////////////////
//:: Name hx_slp_trumpet
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Trumpet used.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oSleep = GetObjectByTag("H2_SleepingMan");
    location lLoc = GetLocation(oPC);

    ActionPauseConversation();
    DelayCommand(4.0, ActionResumeConversation());

    AssignCommand(GetPCSpeaker(), PlaySound("as_cv_eulpipe2"));
   // VFX.
    DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(132), oPC));
    DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(134), oPC));
    DelayCommand(1.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), lLoc));
    DelayCommand(1.7, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM), lLoc));
    DelayCommand(2.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), lLoc));
    DelayCommand(2.7, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM), lLoc));
    DelayCommand(3.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), lLoc));
    DelayCommand(3.7, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM), lLoc));
}
