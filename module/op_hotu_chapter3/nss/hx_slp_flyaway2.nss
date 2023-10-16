//::///////////////////////////////////////////////
//:: Name hx_slp_flyaway2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping Man flies away. Sensei destroyed.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oSleep = GetObjectByTag("H2_SleepingMan");
    SetLocalInt(GetModule(), "HX_SLEEPING_INVIS_SILENT", TRUE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(), oSleep);

    object oSensei = GetObjectByTag("H2_Sensei");
    AssignCommand(oSensei, SetIsDestroyable(TRUE, FALSE, FALSE));
    DestroyObject(oSensei, 5.0);
}

