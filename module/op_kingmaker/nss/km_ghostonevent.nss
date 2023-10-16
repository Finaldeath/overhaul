//::///////////////////////////////////////////////
//:: Name km_ghostonevent
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cutsom on event script for the ghost lady on event
*/
//:://////////////////////////////////////////////
//:: Created By: Keith k2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetNearestObject(OBJECT_TYPE_CREATURE);
    effect eGhostly = EffectNegativeLevel(d4(1));
    effect eVFX = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);

    string sScream1 = "as_pl_x2screamf5";
    string sScream2 = "as_pl_x2screamf1";
    string sScream3 = "as_pl_screamf5";

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGhostly, oTarget, 20.0f + Random(9));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVFX, oTarget);
    FloatingTextStringOnCreature("The sadness of the spirit drains your energy.", oTarget);

    AssignCommand(oTarget, ClearAllActions(TRUE));

    switch (Random(3))
    {
        case 0 :
            AssignCommand(oTarget, PlaySound(sScream1));
        break;

        case 1 :
            AssignCommand(oTarget, PlaySound(sScream2));
        break;

        case 2 :
            AssignCommand(oTarget, PlaySound(sScream3));
        break;
    }

    DestroyObject(OBJECT_SELF, 1.0f);
}
