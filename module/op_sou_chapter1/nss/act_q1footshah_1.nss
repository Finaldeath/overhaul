//::///////////////////////////////////////////////
//:: act_q1footshah_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Shadow Hart will flee after having been
    warned by the PC..  Reward Good XP
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 28/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{

        //Blink stag will teleport away
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HOWL_MIND), GetLocation(OBJECT_SELF));

    DestroyObject(OBJECT_SELF, 1.5);

    RewardXP("xplow", 100, GetPCSpeaker());
    AdjustAlignment(GetPCSpeaker(),ALIGNMENT_GOOD, 2);

}
