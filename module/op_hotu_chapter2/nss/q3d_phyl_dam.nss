// Dracolich jumps to protect phylactery

void main()
{
    object oDraco = GetObjectByTag("q3_vixthra");
    if(oDraco == OBJECT_INVALID || GetIsDead(oDraco))
    {
        oDraco = GetNearestObjectByTag("q3d_skeleton");
        if(oDraco != OBJECT_INVALID && GetIsDead(oDraco))
        {
            oDraco = GetNearestObjectByTag("q3d_skeleton", oDraco);
            if(oDraco != OBJECT_INVALID &&  GetIsDead(oDraco))
            {
                oDraco = GetNearestObjectByTag("q3d_skeleton", oDraco);
            }
        }
    }
    if(oDraco == OBJECT_INVALID || GetIsDead(oDraco))
        return;
    object oWP = GetWaypointByTag("q3d_wp_protect");
    object oPC = GetLastDamager();
    float fDistance = GetDistanceBetween(OBJECT_SELF, oDraco);
    if(fDistance > 10.0)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

        effect eJump = EffectDisappearAppear(GetLocation(oWP));
        effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eJump, oDraco, 3.0);
        DelayCommand(3.0, AssignCommand(oPC, PlaySound("c_dragnold_bat2")));
        DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eShake, GetLocation(oPC)));

    }
}
