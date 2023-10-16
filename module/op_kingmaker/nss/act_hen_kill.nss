//::///////////////////////////////////////////////
//:: act_hen_kill
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
    object oCal = GetObjectByTag("q3_sur_cal");
    object oKai = GetObjectByTag("q3_sur_kai");
    object oTrp = GetObjectByTag("q3_sur_trp");
    object oJab = GetObjectByTag("q3_sur_jab");
    if(GetIsObjectValid(oCal))
    {
        SetImmortal(oCal,FALSE);
        ChangeToStandardFaction(oCal,STANDARD_FACTION_HOSTILE);
        AssignCommand(oCal,DetermineCombatRound());
    }
    if(GetIsObjectValid(oKai))
    {
        SetImmortal(oKai,FALSE);
        ChangeToStandardFaction(oKai,STANDARD_FACTION_HOSTILE);
        AssignCommand(oKai,DetermineCombatRound());
    }
    if(GetIsObjectValid(oTrp))
    {
        SetImmortal(oTrp,FALSE);
        ChangeToStandardFaction(oTrp,STANDARD_FACTION_HOSTILE);
        AssignCommand(oTrp,DetermineCombatRound());
    }
    if(GetIsObjectValid(oJab))
    {
        SetImmortal(oJab,FALSE);
        ChangeToStandardFaction(oJab,STANDARD_FACTION_HOSTILE);
        AssignCommand(oJab,DetermineCombatRound());
    }
}
