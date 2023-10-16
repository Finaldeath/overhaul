//::///////////////////////////////////////////////
//:: Haedraline Normal End Conversation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Normal end of conversation means player ended
    it properly.
    Initiate her 'next time I talk' global.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "m3plotinclude"
void main()
{
    if (GetIsObjectValid(GetPCSpeaker()) == FALSE)
    {
        return;
    }
    HaedralineUnlocksDoor();

    if (GetLocalInt(GetModule(),"NW_G_M3Q1A01_HAEDRALINE") == 0)
    {
        // * prepare for second
        SetLocalInt(GetModule(),"NW_G_M3Q1A01_HAEDRALINE",10);
    }
    else
    if (GetLocalInt(GetModule(),"NW_G_M3Q1A01_HAEDRALINE") == 10)
    {
        // * prepare for third
        SetLocalInt(GetModule(),"NW_G_M3Q1A01_HAEDRALINE",20);
    }
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),OBJECT_SELF);
    DelayCommand(0.7,DestroyObject(OBJECT_SELF));

    // * this lets the recall stone work normally again
    SetLocalInt(GetModule(),"NW_G_RECALL_HAED", 0);
}

