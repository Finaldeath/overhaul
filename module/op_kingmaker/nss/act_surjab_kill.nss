//::///////////////////////////////////////////////
//:: act_surjab_kill
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
    object oTrp = GetObjectByTag("q3_sur_trp");
    object oPC = GetFirstPC();
    SetImmortal(OBJECT_SELF,FALSE);
    ClearAllActions(TRUE);
    ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_HOSTILE);
    DetermineCombatRound(oPC);

    object oHenTrp = GetObjectByTag("os_hen_trp");
    object oHenKai = GetObjectByTag("os_hen_kai");
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
    if(GetIsObjectValid(oTrp))
    {
        SetImmortal(oTrp,FALSE);
        ChangeToStandardFaction(oTrp,STANDARD_FACTION_HOSTILE);
        DelayCommand(1.5f, AssignCommand(oTrp,DetermineCombatRound(oPC)));
    }

    if (oHenTrp != OBJECT_INVALID)
        DelayCommand(1.5f, AssignCommand(oHenTrp, DetermineCombatRound(oSelf)));
    if (oHenKai != OBJECT_INVALID)
        DelayCommand(1.5f, AssignCommand(oHenKai, DetermineCombatRound(oSelf)));
    if (oHenCal != OBJECT_INVALID)
        DelayCommand(1.5f, AssignCommand(oHenCal, DetermineCombatRound(oSelf)));
}
