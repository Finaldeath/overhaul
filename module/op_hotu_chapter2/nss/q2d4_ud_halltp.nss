//::///////////////////////////////////////////////
//:: Name: q2d4_ud_halltp
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
        // then teleport the PC to the city
        effect eVfx1 = EffectVisualEffect(VFX_IMP_AC_BONUS);
        effect eVfx2 = EffectVisualEffect(VFX_IMP_DEATH);
        effect eVfx3 = EffectVisualEffect(VFX_IMP_HEALING_G);  //healing x, polymorph, wind 134
        effect eLink1 = EffectLinkEffects(eVfx1, eVfx2);
        effect eLink = EffectLinkEffects(eLink1, eVfx3);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oToEffect);

        //Jump the PC to the city
        SetLocalInt(oToEffect, "X2_Q2D_HallToCity", 1);
        object oTarget = GetWaypointByTag("wp_q2d2_hallteleport");

        DelayCommand(2.0, AssignCommand(oToEffect, ActionJumpToObject(oTarget)));
    }
    //else do some other kind of effects cause the teleporter won't work..   restoration great
    else
    {
        effect eVfxBad = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVfxBad, oToEffect);
        FloatingTextStrRefOnCreature(85717, oToEffect);
    }

}
