//::///////////////////////////////////////////////
//:: Name crytower_hb_vfx
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
        if (GetLocalInt(OBJECT_SELF, "nVFXActive") == 0)
        {
            SetLocalInt(OBJECT_SELF, "nVFXActive", 1);
            float fRandom = IntToFloat(Random(15));
            DelayCommand(fRandom, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUNBEAM), OBJECT_SELF));
            DelayCommand(fRandom, SetLocalInt(OBJECT_SELF, "nVFXActive", 0));
        }
    }
}
