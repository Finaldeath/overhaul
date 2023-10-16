
const string sMsg = "You have failed in your mission to become the Lord of Cyan. Your magic weapon has taken back the life it gave you.";

void main()
{
    object oPC = GetPCSpeaker();
    effect eVFX_EExplosion = EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION);
    effect eVFX_Bansh = EffectVisualEffect(VFX_FNF_WAIL_O_BANSHEES);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX_Bansh, oPC);
    AssignCommand(oPC, SetCameraFacing(280.0f, 16.0f, 60.0f, CAMERA_TRANSITION_TYPE_SLOW));
    DelayCommand(2.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX_EExplosion, oPC));

    DelayCommand(3.0f,
        AssignCommand(oPC,
            ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0f, 40000.0f)));

    DelayCommand(6.0f, FadeToBlack(oPC));
    DelayCommand(7.0f, PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, sMsg));
}
