//::///////////////////////////////////////////////
//:: Name act_q6deekin_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
pause the dialogue
have Deekin run off for a moment and then come back
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 5/03
//:://////////////////////////////////////////////

void MakePortal(object oMe);
void main()
{
    object oPC = GetPCSpeaker();
    object oMe = OBJECT_SELF;
    ActionPauseConversation();


    ActionMoveAwayFromObject(oPC, TRUE, 10.0);
    DelayCommand(2.0, ClearAllActions(TRUE));
    effect eSong = EffectVisualEffect(VFX_DUR_BARD_SONG);

    DelayCommand(2.0, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 2.0, 4.0));
    DelayCommand(2.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSong, oMe, 4.0));
    DelayCommand(3.0, MakePortal(oMe));

    DelayCommand(9.5, ActionMoveToObject(oPC, TRUE));
    DelayCommand(10.0, ActionResumeConversation());
}
void MakePortal(object oMe)
{
    vector vSelf = GetPosition(oMe);
    vector vTarget = Vector(vSelf.x, vSelf.y, vSelf.z + 2.0);
    location lTarget = Location(GetArea(oMe), vTarget, 0.0);
    effect ePortal = EffectVisualEffect(VFX_IMP_HEALING_X);
    effect ePortal2 = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);

    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePortal, lTarget));
    DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePortal, lTarget));
    DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePortal2, lTarget));

    DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePortal, lTarget));
}
