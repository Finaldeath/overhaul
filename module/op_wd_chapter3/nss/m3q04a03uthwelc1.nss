#include "nw_i0_plot"
void main()
{
   SetLocalInt(OBJECT_SELF,"NW_L_M3Q04TALKHEALED",1);
   SetLocalInt(GetModule(),"NW_G_M3Q04PLOTHEALED", GetLocalInt(GetModule(),"NW_G_M3Q04PLOTHEALED")+1);
   SetLocalObject(GetModule(),"M3Q04CPCHEALER",GetPCSpeaker());
   RewardXP("M3Q2_SMALL_REWARDS",25,GetPCSpeaker());

}
