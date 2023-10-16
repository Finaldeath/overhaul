//::///////////////////////////////////////////////
//:: Nanny Custom User Defined Event
//:: 2q4_nanny_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 24, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        effect eVis = EffectVisualEffect(VFX_DUR_WEB);
        effect eParal = EffectEntangle();
        effect eLink = EffectLinkEffects(eVis, eParal);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, OBJECT_SELF);
        SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT, FALSE);
    }
}

