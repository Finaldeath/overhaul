//::///////////////////////////////////////////////
//:: Name ent_wind2rstrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set up the runestone effects the first time
    the trigger is entered
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nBeamSetUp") != 1)
    {
        //Set up beam effects once..
        SetLocalInt(OBJECT_SELF, "nBeamSetUp", 1);
        //Rune stone effects
        object oStone1 = GetObjectByTag("winds02_rs_1_1");
        object oStone2 = GetObjectByTag("winds02_rs_1_2");
        object oStone3 = GetObjectByTag("winds02_rs_1_3");
        object oStone4 = GetObjectByTag("winds02_rs_1_4");
        object oStone5 = GetObjectByTag("winds02_rs_1_5");
        object oStone6 = GetObjectByTag("winds02_rs_1_6");
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PARALYZE_HOLD), oStone1);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PARALYZE_HOLD), oStone2);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PARALYZE_HOLD), oStone3);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PARALYZE_HOLD), oStone4);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PARALYZE_HOLD), oStone5);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PARALYZE_HOLD), oStone6);

    }

}
