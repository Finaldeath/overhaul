//::///////////////////////////////////////////////
//:: Name: q2d_spell_tchst
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On casting of dispel magic at any of the chests
    all the chests will explode
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Dec 10/02
//:://////////////////////////////////////////////


void main()
{
    if (GetLastSpell() == SPELL_DISPEL_MAGIC || GetLastSpell() == SPELL_GREATER_DISPELLING || GetLastSpell() == SPELL_LESSER_DISPEL)
    {
        //The chest objects
        object oChest1 = GetObjectByTag("q2d_trapchest1");
        object oChest2 = GetObjectByTag("q2d_trapchest2");
        object oChest3 = GetObjectByTag("q2d_trapchest3");
        object oChest4 = GetObjectByTag("q2d_trapchest4");
        object oChest5 = GetObjectByTag("q2d_trapchest5");
        object oChest6 = GetObjectByTag("q2d_trapchest6");
        object oChest7 = GetObjectByTag("q2d_trapchest7");

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

        //Laughing effect at PC
        AssignCommand(GetLastUsedBy(), PlaySound("as_pl_laughingm4"));
    }
}
