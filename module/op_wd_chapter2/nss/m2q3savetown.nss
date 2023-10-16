#include "nw_i0_plot"

void main()
{
    RewardXP("m2q3E_Charwood",60,GetPCSpeaker());
    CreateObject(OBJECT_TYPE_PLACEABLE,"m2q3gb_chest",GetLocation(GetWaypointByTag("WP_MOBLEY_CHEST")));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DISPEL),GetLocation(OBJECT_SELF));
    DestroyObject(OBJECT_SELF);
}
