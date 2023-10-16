//::///////////////////////////////////////////////
//:: Name arctower_hb_vfx4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Apply an ambient visual effect to the invisible
    object on its heartbeat...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On:April 24/03
//:://////////////////////////////////////////////

void main()
{
    if (GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC)) == TRUE)
    {
        float fRandom = IntToFloat(Random(6));
        DelayCommand(fRandom, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HOWL_MIND), OBJECT_SELF));
        DelayCommand(fRandom + 3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HOWL_ODD), OBJECT_SELF));
    }
}
