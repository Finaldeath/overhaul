// Disables the armor trap

float DURATION = 12.0;
float BOLT_DELAY = 0.7;

void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oPC = GetLastUsedBy();

    object oMarker1 = GetNearestObjectByTag("q4b_trap_marker1");
    object oMarker2 = GetNearestObjectByTag("q4b_trap_marker2");
    object oMarker3 = GetNearestObjectByTag("q4b_trap_marker3");
    object oMarker4 = GetNearestObjectByTag("q4b_trap_marker4");

    object oTrap = GetObjectByTag("q4b_armor_gas_trap");

    StoreCameraFacing();
    SetCameraMode(oPC, CAMERA_MODE_TOP_DOWN);
    AssignCommand(oPC, SetCameraFacing(0.0, 40.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_FAST));

    float fDelay;
    int i;
    for(i = 1; i <= 6; i++)
    {
        DelayCommand(fDelay, AssignCommand(oMarker1, ActionCastFakeSpellAtObject(SPELLABILITY_BOLT_SLOW, oMarker2)));
        DelayCommand(BOLT_DELAY + fDelay, AssignCommand(oMarker2, ActionCastFakeSpellAtObject(SPELLABILITY_BOLT_SLOW, oMarker3)));
        DelayCommand(BOLT_DELAY * 2 + fDelay, AssignCommand(oMarker3, ActionCastFakeSpellAtObject(SPELLABILITY_BOLT_SLOW, oMarker4)));
        DelayCommand(BOLT_DELAY * 3 + fDelay, AssignCommand(oMarker4, ActionCastFakeSpellAtObject(SPELLABILITY_BOLT_SLOW, oMarker1)));
        DelayCommand(BOLT_DELAY * 4 + fDelay, DestroyObject(oTrap));
        fDelay += 0.1;
    }
    DelayCommand(BOLT_DELAY * 4 + fDelay, RestoreCameraFacing());

}
