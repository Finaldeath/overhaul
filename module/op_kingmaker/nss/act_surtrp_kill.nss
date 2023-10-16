//::///////////////////////////////////////////////
//:: act_surtrp_kill
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Takes away the plot flag and sets the henchman hostile
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "nw_i0_generic"
void main()
{
    object oSelf = OBJECT_SELF;
    object oCal = GetObjectByTag("q3_sur_cal");
    object oKai = GetObjectByTag("q3_sur_kai");
    object oJab = GetObjectByTag("q3_sur_jab");
    object oPC = GetFirstPC();
    SetImmortal(OBJECT_SELF,FALSE);
    ClearAllActions(TRUE);
    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    DetermineCombatRound(oPC);

    object oHenKai = GetObjectByTag("os_hen_kai");
    object oHenJab = GetObjectByTag("os_hen_jab");
    object oHenCal = GetObjectByTag("os_hen_cal");

    if(GetIsObjectValid(oCal))
    {
        SetImmortal(oCal,FALSE);
        ChangeToStandardFaction(oCal,STANDARD_FACTION_HOSTILE);
        DelayCommand(1.5f, AssignCommand(oCal,DetermineCombatRound(oPC)));
    }
    if(GetIsObjectValid(oKai))
    {
        SetImmortal(oKai,FALSE);
        ChangeToStandardFaction(oKai,STANDARD_FACTION_HOSTILE);
        DelayCommand(1.5f, AssignCommand(oKai,DetermineCombatRound(oPC)));
    }
    if(GetIsObjectValid(oJab))
    {
        SetImmortal(oJab,FALSE);
        ChangeToStandardFaction(oJab,STANDARD_FACTION_HOSTILE);
        DelayCommand(1.5f, AssignCommand(oJab,DetermineCombatRound(oPC)));
    }

    if (oHenKai != OBJECT_INVALID)
        DelayCommand(1.5f, AssignCommand(oHenKai, DetermineCombatRound(oSelf)));
    if (oHenJab != OBJECT_INVALID)
        DelayCommand(1.5f, AssignCommand(oHenJab, DetermineCombatRound(oSelf)));
    if (oHenCal != OBJECT_INVALID)
        DelayCommand(1.5f, AssignCommand(oHenCal, DetermineCombatRound(oSelf)));
}
