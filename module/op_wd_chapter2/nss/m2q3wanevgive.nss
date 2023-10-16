//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3WanevGive
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Wanev gives the player his wardstone.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 26, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    object oItem = GetItemPossessedBy(OBJECT_SELF,"M2Q01IWARDWANEV");

    TakeGold(GetLocalInt(OBJECT_SELF,"NW_L_Payment"),GetPCSpeaker());
    ActionGiveItem(oItem,GetPCSpeaker());
    ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,1.0,2.0);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_PULSE_FIRE),OBJECT_SELF,1.0);
    ActionJumpToObject(GetWaypointByTag("WP_M2Q3_WANEVNPC"));
}
