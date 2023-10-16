//::///////////////////////////////////////////////
//:: Punish naughty player
//:: con_mw_punish
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Player has been naughty and is being punished
    by the magical sword.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    effect eVFX = EffectVisualEffect(VFX_FNF_WAIL_O_BANSHEES);
    effect eVFX2 = EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION);
    effect eDeath = EffectDeath(TRUE);

    //ActionPauseConversation();
    SetCommandable(TRUE, oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oPC);
    AssignCommand(oPC, SetCameraFacing(-1.0f, 16.0f, 30.0f, CAMERA_TRANSITION_TYPE_SLOW));
    DelayCommand(2.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX2, oPC));

    DelayCommand(3.0f,
        AssignCommand(oPC,
            ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0f, 40000.0f)));

    DelayCommand(6.0f, FadeToBlack(oPC));
    DelayCommand(7.0f, PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, "You have angered your magic weapon and it is refusing to resurrect you."));

    //DelayCommand(3.7f, ActionResumeConversation());
}
