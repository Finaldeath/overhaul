//::///////////////////////////////////////////////
//:: act_mw_afterrat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The light destroys itself
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
//:: Modified By: Keith K2 Hayward
//:: Modified On: April 2004
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetFirstPC();
    object oCal = GetObjectByTag("os_cut_cal");
    object oJab = GetObjectByTag("os_cut_jab");
    object oKai = GetObjectByTag("os_cut_kai");
    object oTrp = GetObjectByTag("os_cut_trp");
    effect eBeam = EffectBeam(VFX_BEAM_LIGHTNING,OBJECT_SELF,BODY_NODE_HAND);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam,oCal,1.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam,oJab,1.1);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam,oKai,1.2);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam,oTrp,1.3);
    SetLocalInt(oPC,"OS_MW_RATSDEAD",2);

    // Make sure the light is correctly destroyed and ensure the PC isn't
    // stuck in enternal cutscene mode :(
    ExecuteScript("q3ai_mw_endconv", OBJECT_SELF);
}
