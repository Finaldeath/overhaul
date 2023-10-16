//::///////////////////////////////////////////////
//:: Name hx_slp_freezes
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping Man frozen, shatters.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oSleep = GetObjectByTag("H2_SleepingMan");
    location lLoc = GetLocation(oSleep);

    // Variable is not really dead, just means the invis object willnot start a conv
    // now that he is awake or gone.
    SetLocalInt(GetModule(), "HX_SLEEPING_INVIS_SILENT", TRUE);

    //Flag him as actually dead
    SetLocalInt(GetModule(), "bSleepingManPlotDead", TRUE);

    // Freezes.
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), oSleep);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_ICESKIN), oSleep);

    // He shatters.
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lLoc));
    DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oSleep));

    // Destroyed.
    SetPlotFlag(oSleep, FALSE);
    SetImmortal(oSleep, FALSE);
    DestroyObject(oSleep, 1.0);
}
