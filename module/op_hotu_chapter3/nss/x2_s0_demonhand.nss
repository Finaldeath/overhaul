//::///////////////////////////////////////////////
//:: Name x2_s0_demonhand
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Impact script for the demonic grappling
     hand. Just applies a visual effect to target.
     It will also destroy rats.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 23, 2003
//:://////////////////////////////////////////////
// Kill the rat
void KillRat(object oEnemy);

void main()
{
    object oTarget = GetSpellTargetObject();

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(475), oTarget);
    if(GetTag(oTarget) == "hx_mimic_enemy")
    {
        DelayCommand(0.5, KillRat(oTarget));
    }
}

// Kill the rat
void KillRat(object oEnemy)
{
    int iAteGem = GetLocalInt(oEnemy, "HX_RAT_ATE_GEM");
    location lLoc = GetLocation(oEnemy);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oEnemy);

    DelayCommand(0.05, PlaySound("bf_med_insect"));
    DelayCommand(0.06, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL), lLoc));
    if(iAteGem == TRUE)
    {
        object oGem = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_mimic_pcgem", lLoc);
        if(GetLocalInt(GetModule(), "PCHasHellRingOn") == 1)
        {
            AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_PURPLE), oGem));
        }
    }
    DelayCommand(1.0, DestroyObject(oEnemy));
}
