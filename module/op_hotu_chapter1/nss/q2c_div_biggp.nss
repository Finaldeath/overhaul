//::///////////////////////////////////////////////
//:: Name  : q2c_div_biggp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Divinity Altar -5000 gp donation
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Dec 10/02
//:://////////////////////////////////////////////


void main()
{
    SetLocalInt(GetModule(), "X2_nDivinityAltarOff", 1);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_RESTORATION_GREATER), OBJECT_SELF);
    object oBeast = CreateObject(OBJECT_TYPE_CREATURE, "q2c_divinebeast", GetLocation(GetWaypointByTag("wp_q2c_divinebeast")));
    AssignCommand(oBeast, ActionStartConversation(GetPCSpeaker()));
    DestroyObject(OBJECT_SELF, 1.0);
}
