//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Deus and Mac kill Typhus, can just be faked
     Mark PC as not votable for Thaddeus
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    SetLocalInt(GetModule(),"OS_KILLTYPHUS",30);

    object oTyphus = GetObjectByTag("q2_typhus");
    object oDeus = GetObjectByTag("q2_deus");
    object oMac = GetObjectByTag("q2_mac");
    object oFactguy = GetObjectByTag("q2_factguy");
    object oFactguy2 = GetObjectByTag("q2_factguy2");
    //The Attack
    SetPlotFlag(oDeus,TRUE);
    SetPlotFlag(oMac,TRUE);
    ChangeFaction(oDeus,oFactguy);
    ChangeFaction(oMac,oFactguy);
    ChangeFaction(oTyphus,oFactguy2);
    AssignCommand(oMac,DetermineCombatRound(oTyphus));
    AssignCommand(oDeus,DetermineCombatRound(oTyphus));
//    AssignCommand(oDeus, ActionMoveToObject(oTyphus,TRUE));
//    AssignCommand(oMac,ActionMoveToObject(oTyphus,TRUE));
//    effect eDam = EffectDamage(1000);
//    AssignCommand(oTyphus,ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oTyphus));
}
