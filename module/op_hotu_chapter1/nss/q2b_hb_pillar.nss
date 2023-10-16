//::///////////////////////////////////////////////
//:: Name q2b_hb_pillar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When Created apply a coloured effect to the
    pillar
     Rod Colour
    1 = Blue
    2 = Green
    3 = Red
    4 = White
    5 = Yellow
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 16/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") == 1)
        return;
    SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

    effect eGlow;

    int nColour = StringToInt(GetStringRight(GetTag(OBJECT_SELF), 1));

    switch (nColour)
    {
        case 1: eGlow = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
                break;
        case 2: eGlow = EffectVisualEffect(VFX_DUR_GLOW_GREEN);
                break;
        case 3: eGlow = EffectVisualEffect(VFX_DUR_GLOW_RED);
                break;
        case 4: eGlow = EffectVisualEffect(VFX_DUR_GLOW_WHITE);
                break;
        case 5: eGlow = EffectVisualEffect(VFX_DUR_GLOW_YELLOW);
                break;

    }

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGlow, OBJECT_SELF);
}
