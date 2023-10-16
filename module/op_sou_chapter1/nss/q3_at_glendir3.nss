// glendir runs away and found dead later

#include "q3_inc_plot"

void Die()
{
    CreateObject(OBJECT_TYPE_CREATURE, "q3_gnoll_warrior", GetLocation(OBJECT_SELF));
    effect eDam = EffectDamage(1000);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, OBJECT_SELF);
    SetLocalInt(GetModule(), "q3_Glendir_Dead", 1);
    SetLocalInt(GetModule(), "q3_Glendir_OnHisOwn", 1);
}

void main()
{
    object oRunWP = GetNearestObjectByTag("Q3A_WP_OUT_OF_ROOM", OBJECT_SELF, 2);
    object oBody = GetWaypointByTag("Q3A_WP_GLENDIR_BODY");
    ClearAllActions();
    ActionForceMoveToObject(oRunWP, TRUE, 1.5, 6.0);
    ActionJumpToObject(oBody);
    ActionDoCommand(Die());
    SetCommandable(FALSE);
}
