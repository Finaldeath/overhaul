//::///////////////////////////////////////////////
//:: Name q3b_hb_earthped
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Earth pedestal heartbeat.  If there is
        a PC in the trigger - create the vfx
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 4/03
//:://////////////////////////////////////////////
void CreateVfx(location lTarget);
void main()
{
    //if there is a pc in the trigger - do your stuff
    if (GetLocalInt(OBJECT_SELF, "X1_Q3B_NUMPC") > 0)
    {
        object oEarthPed = GetWaypointByTag("wp_q3b_pedearth");
        location lVfx = GetLocation(oEarthPed);
        CreateVfx(lVfx);
        DelayCommand(2.5, CreateVfx(lVfx));
    }

}
void CreateVfx(location lTarget)
{
    //Create earth shower effect

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(137), lTarget);
}
