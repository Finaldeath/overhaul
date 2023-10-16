//::///////////////////////////////////////////////
//:: Name q2d8_return
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Return all PCs that are in the Illusionary Glade
    to the Brain Pool.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////
void ReturnHenchman(object oPC);
void main()
{

    effect eVis1 = EffectVisualEffect(VFX_IMP_AC_BONUS);
    effect eVis2 = EffectVisualEffect(VFX_FNF_PWSTUN);
    effect eLink = EffectLinkEffects(eVis1, eVis2);

    object oTarget = GetWaypointByTag("wp_q2d4_hallreturn");

    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {

        if (GetTag(GetArea(oPC)) == "q2dforest")
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            SetLocalInt(oPC, "X2_Q2DFromForest", 1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oPC);
            DelayCommand(1.0, ReturnHenchman(oPC));
            DelayCommand(1.0, AssignCommand(oPC, JumpToObject(oTarget)));
        }
        oPC = GetNextPC();
    }
}
void ReturnHenchman(object oPC)
{
    int nCount = 1;
    effect eEffect;
    object oHench = GetHenchman(oPC, nCount);
    while (GetIsObjectValid(oHench) == TRUE)
    {
        eEffect = GetFirstEffect(oHench);
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            RemoveEffect(oHench, eEffect);
            eEffect = GetNextEffect(oHench);
        }
        nCount++;
        oHench = GetHenchman(oPC, nCount);
    }
}
