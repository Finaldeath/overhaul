void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);

    effect eVFX_freeze = EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
    effect eVFX_Stop = EffectVisualEffect(VFX_FNF_TIME_STOP);
    effect eVFX_Dispell = EffectVisualEffect(VFX_IMP_DISPEL);

    object oTarget = GetFirstObjectInArea(oArea);

    SetLocalInt(OBJECT_SELF, "flg_cutrunning", FALSE);
    AssignCommand(oPC, SetCameraFacing(280.0f, 9.0f, 70.0f, CAMERA_TRANSITION_TYPE_MEDIUM));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX_Stop, oPC);

    while (GetIsObjectValid(oTarget) == TRUE)
    {
        if ((GetObjectType(oTarget) == OBJECT_TYPE_CREATURE) && (oTarget != oPC))
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX_freeze, oTarget);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX_Dispell, oTarget);
        }

        oTarget = GetNextObjectInArea(oArea);
    }

}
