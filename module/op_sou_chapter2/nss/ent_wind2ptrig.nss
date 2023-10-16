//::///////////////////////////////////////////////
//:: Name ent_wind2ptrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Activate the Pentagram beam effect first time
    trigger is entered
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
        object oBeam1_1 = GetObjectByTag("winds2_beam1_1");
        object oBeam1_2 = GetObjectByTag("winds2_beam1_2");
        object oBeam1_3 = GetObjectByTag("winds2_beam1_3");
        object oBeam1_4 = GetObjectByTag("winds2_beam1_4");
        object oBeam1_5 = GetObjectByTag("winds2_beam1_5");
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_EVIL, oBeam1_1, BODY_NODE_CHEST), oBeam1_4);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_EVIL, oBeam1_4, BODY_NODE_CHEST), oBeam1_3);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_EVIL, oBeam1_3, BODY_NODE_CHEST), oBeam1_2);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_EVIL, oBeam1_2, BODY_NODE_CHEST), oBeam1_5);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_EVIL, oBeam1_5, BODY_NODE_CHEST), oBeam1_1);
    }
}
