//::///////////////////////////////////////////////
//:: M3Q1_SLEEP_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets his sleeping visual effect.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori
//:: Created On:    March 11, 2002
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if(nEvent = 1001)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SLEEP), OBJECT_SELF);
    }
}
