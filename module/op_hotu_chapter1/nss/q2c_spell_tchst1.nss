//::///////////////////////////////////////////////
//:: Name: q2c_spell_tchst
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If dispel magic is cast at one of the trapped chests
    they will all dissppear - reward xp and create 'real'
    treasure
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Dec 10/02
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "x2_inc_plot"

void main()
{


    if (GetLastSpell() == SPELL_DISPEL_MAGIC || GetLastSpell() == SPELL_GREATER_DISPELLING || GetLastSpell() == SPELL_LESSER_DISPEL)
    {
        object oWaypoint = GetWaypointByTag("wp_q2c_treaschest");
        //The chest objects
        object oChest1 = GetObjectByTag("q2c_trapchest1");
        object oChest2 = GetObjectByTag("q2c_trapchest2");
        object oChest3 = GetObjectByTag("q2c_trapchest3");
        object oChest4 = GetObjectByTag("q2c_trapchest4");
        object oChest5 = GetObjectByTag("q2c_trapchest5");
        object oChest6 = GetObjectByTag("q2c_trapchest6");
        object oChest7 = GetObjectByTag("q2c_trapchest7");

        //Disappear effects
        effect eEffect1 = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
        effect eEffect2 = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_GREASE);

        //Apply effects to each chest
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectLinkEffects(eEffect1, eEffect2), GetLocation(oChest1));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectLinkEffects(eEffect1, eEffect2), GetLocation(oChest2));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectLinkEffects(eEffect1, eEffect2), GetLocation(oChest3));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectLinkEffects(eEffect1, eEffect2), GetLocation(oChest4));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectLinkEffects(eEffect1, eEffect2), GetLocation(oChest5));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectLinkEffects(eEffect1, eEffect2), GetLocation(oChest6));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectLinkEffects(eEffect1, eEffect2), GetLocation(oChest7));

        //Destroy each chest
        DestroyObject(oChest1);
        DestroyObject(oChest2);
        DestroyObject(oChest3);
        DestroyObject(oChest4);
        DestroyObject(oChest5);
        DestroyObject(oChest6);
        DestroyObject(oChest7);

        if (GetLocalInt(GetModule(), "X2_Q2CDispelReward") == 1)
            return;

        SetLocalInt(GetModule(), "X2_Q2CDispelReward", 1);
        object oPC = GetLastSpellCaster();
        if (GetPCTotalLevel(oPC) < 15)
        {
            Reward_2daXP(oPC, 13, FALSE);
        }
        else
        {
            Reward_2daXP(oPC, XP_MEDIUM_HIGH, FALSE);
        }
        AssignCommand(GetLastSpellCaster(), PlaySound("as_cv_bell2"));
        CreateObject(OBJECT_TYPE_PLACEABLE, "q2c_treasure", GetLocation(oWaypoint));
    }
}
