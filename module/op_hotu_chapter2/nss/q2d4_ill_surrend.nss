//::///////////////////////////////////////////////
//:: Name q2d4_ill_surrend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Teleport PC back to Zorvak'Mur.
    Set Variable that the Illithid have surrendered
    and will not help the matron
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    effect eVis1 = EffectVisualEffect(VFX_IMP_AC_BONUS);
    effect eVis2 = EffectVisualEffect(VFX_FNF_PWSTUN);
    effect eLink = EffectLinkEffects(eVis1, eVis2);
    object oTarget = GetWaypointByTag("wp_q2d2_hallteleport");

    AssignCommand(oPC, ClearAllActions());
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oPC);
    DelayCommand(1.0, AssignCommand(oPC, JumpToObject(oTarget)));
}
