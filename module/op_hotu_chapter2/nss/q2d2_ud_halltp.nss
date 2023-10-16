//::///////////////////////////////////////////////
//:: Name: q2d2_ud_halltp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Warm up the teleporter - which will fire a
    User defined event to teleport the PC in 6
    seconds (if he's still in the trigger)
    If the PC is still in the area of the teleporter
    he will be beamed up
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

void main()
{

    int nGood = FALSE;
    string szPCName = GetLocalString(OBJECT_SELF, "PCToTeleport");
    object oPC = GetFirstInPersistentObject();
    object oToEffect;
    while (oPC != OBJECT_INVALID)
    {
        if (GetName(oPC) == szPCName)
        {
            oToEffect = oPC;
            nGood = TRUE;
        }
        oPC = GetNextInPersistentObject();
    }

    // if PC is cleared to teleport - do some Vfx
    if (nGood == TRUE)
    {
        // then teleport the PC to the hall
        effect eVfx1 = EffectVisualEffect(VFX_IMP_AC_BONUS);
        effect eVfx2 = EffectVisualEffect(VFX_IMP_DEATH);
        effect eVfx3 = EffectVisualEffect(VFX_IMP_HEALING_G);  //healing x, polymorph, wind 134
        effect eLink1 = EffectLinkEffects(eVfx1, eVfx2);
        effect eLink = EffectLinkEffects(eLink1, eVfx3);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oToEffect);
        object oTarget;
        //if the mindflayers are hostile - then jump the PC far from the overmind and start the cutscene
        //else if the mindflayers are friendly still - first time up - jump the PC to the overmind room
        //for negotiations
        if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") == 0 && GetLocalInt(GetModule(), "X2_OvermindCutscenePlayed") == 0)
        {
            SetLocalInt(oToEffect, "X2_Q2DBrainTalk", 1);
            oTarget = GetWaypointByTag("wp_q2d4_OvermindStart");
        }
        else
        {
            //variable for the cutscenes
            SetLocalInt(oToEffect, "X2_Q2D4Enterhall", 1);
            //variable for the transporter
            SetLocalInt(oToEffect, "X2_Q2DTPFromCity", 1);
            oTarget = GetObjectByTag("q2d4_citytp");
        }


        DelayCommand(2.0, AssignCommand(oToEffect, ActionJumpToObject(oTarget)));
        //Brain will try to talk to the PC if he is returning with the Mirror
        if (GetLocalInt(GetModule(),"elder_brain") == 2)
        {
            object oPool = GetObjectByTag("q2d_overmind");
            DelayCommand(3.0, AssignCommand(oPool, ActionStartConversation(oToEffect)));

        }
    }
    //else do some other kind of effects cause the teleporter won't work..   restoration great
    else
    {
        effect eVfxBad = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVfxBad, oToEffect);
        FloatingTextStrRefOnCreature(85717, oToEffect);
    }

}
