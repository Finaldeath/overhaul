// open main door -> end of path puzzle

void main()
{
    object oDoor = GetObjectByTag("Q3BAT_Ruins_Temple");
    effect eVis = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
    SetLocked(oDoor, FALSE);
    DelayCommand(4.5, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
    DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oDoor)));
}
