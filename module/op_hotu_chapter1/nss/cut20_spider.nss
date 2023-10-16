//::///////////////////////////////////////////////
//:: Name cut20_spider
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script draws a spider on the ground, made
     from beams. This is for the opening cutscene
     and done just for flavor.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Dec 17, 2002
//:://////////////////////////////////////////////

void main()
{
     object oPillar1 = GetObjectByTag("pillar1");
     object oPillar2 = GetObjectByTag("pillar2");
     object oPillar3 = GetObjectByTag("pillar3");
     object oPillar4 = GetObjectByTag("pillar4");
     object oPillar5 = GetObjectByTag("pillar5");
     object oPillar6 = GetObjectByTag("pillar6");
     object oPillar7 = GetObjectByTag("pillar7");
     object oPillar8 = GetObjectByTag("pillar8");
     object oPillar9 = GetObjectByTag("pillar9");
     object oPillar10 = GetObjectByTag("pillar10");
     object oPillar11 = GetObjectByTag("pillar11");
     object oPillar12 = GetObjectByTag("pillar12");
     object oPillar13 = GetObjectByTag("pillar13");
     object oPillar14 = GetObjectByTag("pillar14");
     object oPillar15 = GetObjectByTag("pillar15");
     object oPillar16 = GetObjectByTag("pillar16");
     object oPillar17 = GetObjectByTag("pillar17");
     object oPillar18 = GetObjectByTag("pillar18");
     object oPillar19 = GetObjectByTag("pillar19");
     object oPillar20 = GetObjectByTag("pillar20");
     object oPillar21 = GetObjectByTag("pillar21");
     object oPillar22 = GetObjectByTag("pillar22");
     object oPillar23 = GetObjectByTag("pillar23");
     object oPillar24 = GetObjectByTag("pillar24");
     object oPillar25 = GetObjectByTag("pillar25");
     object oPillar26 = GetObjectByTag("pillar26");
     object oPillar27 = GetObjectByTag("pillar27");
     object oPillar28 = GetObjectByTag("pillar28");
     object oPillar29 = GetObjectByTag("pillar29");
     object oPillar30 = GetObjectByTag("pillar30");
     object oPillar31 = GetObjectByTag("pillar31");
     object oPillar32 = GetObjectByTag("pillar32");
     object oPillar33 = GetObjectByTag("pillar33");
     object oPillar34 = GetObjectByTag("pillar34");


     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar4, BODY_NODE_CHEST, FALSE), oPillar3);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar3, BODY_NODE_CHEST, FALSE), oPillar4);

     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar3, BODY_NODE_CHEST, FALSE), oPillar5);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar5, BODY_NODE_CHEST, FALSE), oPillar6);

     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar6, BODY_NODE_CHEST, FALSE), oPillar7);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar7, BODY_NODE_CHEST, FALSE), oPillar8);

     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar8, BODY_NODE_CHEST, FALSE), oPillar9);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar9, BODY_NODE_CHEST, FALSE), oPillar10);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar10, BODY_NODE_CHEST, FALSE), oPillar11);

     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar11, BODY_NODE_CHEST, FALSE), oPillar12);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar11, BODY_NODE_CHEST, FALSE), oPillar4);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar4, BODY_NODE_CHEST, FALSE), oPillar16);

     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar16, BODY_NODE_CHEST, FALSE), oPillar13);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar3, BODY_NODE_CHEST, FALSE), oPillar15);

     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar15, BODY_NODE_CHEST, FALSE), oPillar14);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar32, BODY_NODE_CHEST, FALSE), oPillar27);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar27, BODY_NODE_CHEST, FALSE), oPillar28);

     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar32, BODY_NODE_CHEST, FALSE), oPillar25);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar25, BODY_NODE_CHEST, FALSE), oPillar26);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar5, BODY_NODE_CHEST, FALSE), oPillar23);

     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar23, BODY_NODE_CHEST, FALSE), oPillar24);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar11, BODY_NODE_CHEST, FALSE), oPillar21);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar21, BODY_NODE_CHEST, FALSE), oPillar22);

     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar29, BODY_NODE_CHEST, FALSE), oPillar19);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar19, BODY_NODE_CHEST, FALSE), oPillar20);

     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar29, BODY_NODE_CHEST, FALSE), oPillar17);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_ODD, oPillar17, BODY_NODE_CHEST, FALSE), oPillar18);
}
