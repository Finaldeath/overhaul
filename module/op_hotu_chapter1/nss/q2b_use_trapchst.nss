//::///////////////////////////////////////////////
//:: Name: q2b_use_trapchst
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On use of any of the trap chests - all the trap
    chests will turn into bats and fly away...
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Dec 10/02
//:://////////////////////////////////////////////


void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        //The chest objects
        object oChest1 = GetObjectByTag("q2b_trapchest1");
        object oChest2 = GetObjectByTag("q2b_trapchest2");
        object oChest3 = GetObjectByTag("q2b_trapchest3");
        object oChest4 = GetObjectByTag("q2b_trapchest4");
        object oChest5 = GetObjectByTag("q2b_trapchest5");
        object oChest6 = GetObjectByTag("q2b_trapchest6");
        object oChest7 = GetObjectByTag("q2b_trapchest7");

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

        //Create a bat where each chest was
        object oBat1 = CreateObject(OBJECT_TYPE_CREATURE, "x2_bat", GetLocation(oChest1));
        object oBat2 = CreateObject(OBJECT_TYPE_CREATURE, "x2_bat", GetLocation(oChest2));
        object oBat3 = CreateObject(OBJECT_TYPE_CREATURE, "x2_bat", GetLocation(oChest3));
        object oBat4 = CreateObject(OBJECT_TYPE_CREATURE, "x2_bat", GetLocation(oChest4));
        object oBat5 = CreateObject(OBJECT_TYPE_CREATURE, "x2_bat", GetLocation(oChest5));
        object oBat6 = CreateObject(OBJECT_TYPE_CREATURE, "x2_bat", GetLocation(oChest6));
        object oBat7 = CreateObject(OBJECT_TYPE_CREATURE, "x2_bat", GetLocation(oChest7));

        //Destroy each chest
        DestroyObject(oChest1);
        DestroyObject(oChest2);
        DestroyObject(oChest3);
        DestroyObject(oChest4);
        DestroyObject(oChest5);
        DestroyObject(oChest6);
        DestroyObject(oChest7);


        //Give message to any PC who destroys the illusionary chests
        FloatingTextStrRefOnCreature(84130, GetLastUsedBy());
    }
}


