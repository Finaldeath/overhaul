//::///////////////////////////////////////////////
//:: Name ent_wind2rcktrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Setup the Bigby's hand effect on the rocks the
    first time the trigger is entered.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: May 12/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nBeamSetUp") != 1)
    {
        //Pentagram beams
        SetLocalInt(OBJECT_SELF, "nBeamSetUp", 1);
        //Desert Rock effects
        object oRock1 = GetObjectByTag("winds02_rock_1_1");
        object oRock2 = GetObjectByTag("winds02_rock_1_2");
        object oRock3 = GetObjectByTag("winds02_rock_1_3");
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_BIGBYS_CLENCHED_FIST), oRock1);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_BIGBYS_CLENCHED_FIST), oRock2);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_BIGBYS_CLENCHED_FIST), oRock3);


    }
}
