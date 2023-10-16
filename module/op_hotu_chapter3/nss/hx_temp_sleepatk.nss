//::///////////////////////////////////////////////
//:: Name hx_temp_sleepatk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping man attacks
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oSleep = GetObjectByTag("H2_SleepingMan");
    object oSensei = GetObjectByTag("H2_Sensei");

    if(!GetIsObjectValid(oPC))
    {
        oPC = GetLastSpeaker();
    }

    if(GetIsObjectValid(oSensei))
    {
        AssignCommand(oSensei, SetIsDestroyable(TRUE, FALSE, FALSE));
        DestroyObject(oSensei, 2.0);
    }

    SetPlotFlag(oSleep, FALSE);
    //SetIsTemporaryEnemy(oPC, oSleep);
    ChangeToStandardFaction(oSleep, STANDARD_FACTION_HOSTILE);
    AssignCommand(oSleep, ActionEquipMostDamagingMelee());
    DelayCommand(0.5, AssignCommand(oSleep, ActionAttack(oPC)));
}
