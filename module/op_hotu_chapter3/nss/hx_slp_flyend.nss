//::///////////////////////////////////////////////
//:: Name hx_slp_flyend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping Man flies away and is flagged to
     show up in the end battle with Meph.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oSleep = GetObjectByTag("H2_SleepingMan");

    SetLocalInt(GetModule(), "HX_SLEEPING_INVIS_SILENT", TRUE);
    SetLocalInt(GetModule(), "HX_SLEEPING_END_BATTLE", TRUE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(), oSleep);
}
