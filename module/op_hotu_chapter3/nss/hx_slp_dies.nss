//::///////////////////////////////////////////////
//:: Name hx_slp_dies
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping Man dies.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oSleep = GetObjectByTag("H2_SleepingMan");

    //Flag him as actually dead
    SetLocalInt(GetModule(), "bSleepingManPlotDead", TRUE);

    SetLocalInt(GetModule(), "HX_SLEEPING_INVIS_SILENT", TRUE);
    SetPlotFlag(oSleep, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oSleep);
}
