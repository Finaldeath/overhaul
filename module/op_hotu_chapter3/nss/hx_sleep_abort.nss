//::///////////////////////////////////////////////
//:: Name hx_sleep_abort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handles aborting the Sleeping Man's conv
     when he should be attacking the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 30, 2003
//:://////////////////////////////////////////////

void main()
{
    object oSleep = GetObjectByTag("H2_SleepingMan");
    object oPC = GetPCSpeaker();

    if(oPC == OBJECT_INVALID)
    {
        oPC = GetLastSpeaker();
    }

    if(GetLocalInt(GetModule(), "HX_SLEEPMAN_ATTACK") == TRUE)
    {
        SetLocalInt(GetModule(), "HX_SLEEPMAN_ATTACK", FALSE);
        SetPlotFlag(oSleep, FALSE);
        ChangeToStandardFaction(oSleep, STANDARD_FACTION_HOSTILE);
        AssignCommand(oSleep, ActionEquipMostDamagingMelee());
        DelayCommand(0.5, AssignCommand(oSleep, ActionAttack(oPC)));
    }
}
