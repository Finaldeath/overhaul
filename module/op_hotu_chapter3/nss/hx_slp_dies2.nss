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
    object oPC = GetPCSpeaker();
    object oSensei = GetObjectByTag("H2_Sensei");

    // Turn off invis speaker
    SetLocalInt(GetModule(), "HX_SLEEPING_INVIS_SILENT", TRUE);

    if(GetIsObjectValid(oSensei) && !GetIsDead(oSensei))
    {
        location lSensei = GetLocation(GetObjectByTag("hx_temple_sensei_wp"));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2), lSensei);
        AssignCommand(oSensei, ClearAllActions(TRUE));
        AssignCommand(oSensei, ActionJumpToLocation(lSensei));
        DelayCommand(0.5, ChangeToStandardFaction(oSensei, STANDARD_FACTION_HOSTILE));
        DelayCommand(1.0, AssignCommand(oSensei, ActionAttack(oPC)));
    }

    //Flag him as actually dead
    SetLocalInt(GetModule(), "bSleepingManPlotDead", TRUE);

    SetPlotFlag(oSleep, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oSleep);
}
