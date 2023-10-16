//::///////////////////////////////////////////////
//:: act_sur_kill
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Takes away the plot flag and sets the henchmen hostile
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Haywar
//:: Created On: Sept 2004
//:://////////////////////////////////////////////

#include "nw_i0_generic"
void main()
{
    object oTrp = GetObjectByTag("q3_sur_trp");
    object oCal = GetObjectByTag("q3_sur_cal");
    object oKai = GetObjectByTag("q3_sur_kai");
    object oJab = GetObjectByTag("q3_sur_jab");

    object oHenKai = GetObjectByTag("os_hen_kai");
    object oHenJab = GetObjectByTag("os_hen_jab");
    object oHenCal = GetObjectByTag("os_hen_cal");
    object oHenTrp = GetObjectByTag("os_hen_trp");

    object oPC = GetFirstPC();

    if(GetIsObjectValid(oCal))
    {
        SetImmortal(oCal, FALSE);
        SetIsTemporaryEnemy(oPC, oCal);
        ChangeToStandardFaction(oCal, STANDARD_FACTION_HOSTILE);
        DelayCommand(1.0f, AssignCommand(oCal, DetermineCombatRound(oPC)));
    }
    if(GetIsObjectValid(oKai))
    {
        SetImmortal(oKai, FALSE);
        SetIsTemporaryEnemy(oPC, oKai);
        ChangeToStandardFaction(oKai, STANDARD_FACTION_HOSTILE);
        DelayCommand(1.0f, AssignCommand(oKai, DetermineCombatRound(oPC)));
    }
    if(GetIsObjectValid(oJab))
    {
        SetImmortal(oJab, FALSE);
        SetIsTemporaryEnemy(oPC, oJab);
        ChangeToStandardFaction(oJab, STANDARD_FACTION_HOSTILE);
        DelayCommand(1.0f, AssignCommand(oJab,DetermineCombatRound(oPC)));
    }
    if(GetIsObjectValid(oTrp))
    {
        SetImmortal(oTrp, FALSE);
        SetIsTemporaryEnemy(oPC, oTrp);
        ChangeToStandardFaction(oTrp, STANDARD_FACTION_HOSTILE);
        DelayCommand(1.0f, AssignCommand(oTrp,DetermineCombatRound(oPC)));
    }

    if (oHenKai != OBJECT_INVALID)
        DelayCommand(1.5f, AssignCommand(oHenKai, DetermineCombatRound()));
    if (oHenJab != OBJECT_INVALID)
        DelayCommand(1.5f, AssignCommand(oHenJab, DetermineCombatRound()));
    if (oHenCal != OBJECT_INVALID)
        DelayCommand(1.5f, AssignCommand(oHenCal, DetermineCombatRound()));
    if (oHenTrp != OBJECT_INVALID)
        DelayCommand(1.5f, AssignCommand(oHenTrp, DetermineCombatRound()));
}
