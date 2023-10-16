//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nGhosted") == 1)
        return;

    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        SetLocalInt(OBJECT_SELF, "nGhosted", 1);
        effect eVis1 = EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT);
        //effect eVis2 = EffectVisualEffect( VFX_DUR_GHOST_SMOKE);
        //effect eLink = EffectLinkEffects(eVis1, eVis2);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis1, OBJECT_SELF);

    }



}

