//::///////////////////////////////////////////////
//:: Name h4b_flame_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will create random fire effects on the
     pillars that anchor the door.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 5, 2003
//:://////////////////////////////////////////////

void main()
{
    int iTotalPulled = GetLocalInt(GetArea(OBJECT_SELF), "HXTotalPulled");
    float fDelay = IntToFloat(Random(4) + 1);


    // Only do the effect while the puzzle is active.
    if(iTotalPulled < 4)
    {
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), OBJECT_SELF));
    }
}
