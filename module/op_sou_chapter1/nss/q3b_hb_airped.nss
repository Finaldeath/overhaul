//::///////////////////////////////////////////////
//:: Name q3b_hb_airped
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Air pedestal heartbeat.  If there is
        a PC in the trigger - create the vfx
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 4/03
//:://////////////////////////////////////////////
void CreateVfx(location lTarget);
void CreateVfx2(location lTarget);
void main()
{
    //if there is a pc in the trigger - do your stuff
    if (GetLocalInt(OBJECT_SELF, "X1_Q3B_NUMPC") > 0)
    {
        object oAirPed = GetObjectByTag("q3b_ped_air");
        if (GetIsObjectValid(oAirPed) == TRUE)
        {
            location lVfx = GetLocation(oAirPed);
            CreateVfx(lVfx);
            CreateVfx2(lVfx);
            DelayCommand(1.5, CreateVfx2(lVfx));
            DelayCommand(3.0, CreateVfx2(lVfx));
            DelayCommand(3.0, CreateVfx(lVfx));
            DelayCommand(4.5, CreateVfx2(lVfx));
        }
    }

}
void CreateVfx(location lTarget)
{
    //Create Vfx shower effect
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(321), lTarget);
}
void CreateVfx2(location lTarget)
{
    //Create Vfx shower effect
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH_WARD), lTarget);
}
