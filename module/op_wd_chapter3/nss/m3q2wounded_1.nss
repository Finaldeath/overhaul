// * Occasionally hurls up blood
#include "nw_i0_generic"
void main()
{
    if (GetDistanceToObject(GetObjectByTag("WP_M3Q2Wounded_03")) < 5.0)
    {
        DestroyObject(OBJECT_SELF);
    }
    else
    if (GetCurrentHitPoints() < GetMaxHitPoints() && (Random(100)+1 > 50) )
    {
        ClearAllActions();
        SetLocalInt(OBJECT_SELF,"NW_L_VOMIT",1);
        ActionPlayAnimation(ANIMATION_FIREFORGET_BOW);
        object oBlood = CreateObject(OBJECT_TYPE_PLACEABLE, "m3q2_a05_blood", GetLocation(OBJECT_SELF));
        // * destroy the blood after 5 seconds
        AssignCommand(oBlood, DelayCommand(5.0,DestroyObject(oBlood)));
        SpeakOneLinerConversation();
        SetLocalInt(OBJECT_SELF,"NW_L_VOMIT",0);
        ActionDoCommand(WalkWayPoints());
    }
}
