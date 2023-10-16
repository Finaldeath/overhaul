//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName: q2d3_ud_mfsleep
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sleeping Mindflayer User defined - make sleeping sounds
    if they haven't been awakened.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    object oArea = GetObjectByTag("q2dchambers");
    if(nUser == 1001) //HEARTBEAT
    {
        if (GetAILevel() == AI_LEVEL_VERY_LOW)
            return;
        if (GetLocalInt(OBJECT_SELF, "nAwakened") != 1)
        {
            int nRandom = Random(3);
            if (nRandom == 2)
            {
                effect eSleep = EffectVisualEffect(VFX_IMP_SLEEP);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eSleep, OBJECT_SELF);
            }
        }
    }
}


