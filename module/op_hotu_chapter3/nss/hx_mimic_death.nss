//::///////////////////////////////////////////////
//:: Name hx_mimic_death
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawn in a real chest when the PC kills the
    mimic. Then fire the transfer script to put
    the PC's armor on the dead mimic.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 31, 2003
//:://////////////////////////////////////////////

void main()
{
    object oInvis = GetObjectByTag("h4c_gem_controller");
    //object oSound = GetObjectByTag("hx_mimic_dead_s");

    vector vPos = GetPosition(OBJECT_SELF);
    float fFacing = GetFacing(OBJECT_SELF);

    // Spin the placeable to match the mimic.
    if(fFacing <= 180.0)
        fFacing = fFacing + 180.0;
    else
        fFacing = fFacing - 180.0;

    location lLoc = Location(GetArea(OBJECT_SELF), vPos, fFacing);

    //SoundObjectPlay(oSound);
    //AssignCommand(oSound, DelayCommand(2.0, SoundObjectStop(OBJECT_SELF)));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLoc);
    CreateObject(OBJECT_TYPE_PLACEABLE, "hx_mim_chest", lLoc);
    SignalEvent(oInvis, EventUserDefined(8888));
}
