#include "nw_i0_plot"

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_A_KarathisSpawn") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_A_KarathisSpawn",10);
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CKARA",GetLocation(GetWaypointByTag("WP_M2Q1KARATHIS")));
        DestroyObject(GetObjectByTag("M2Q1TKARATHOME"));
        RewardGP(150, GetPCSpeaker());
        RewardXP("m2q1_Lycanthropy",10, GetPCSpeaker());
    }
}
