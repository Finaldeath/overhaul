#include "nw_i0_plot"

void main()
{
    object oKey = GetItemPossessedBy(OBJECT_SELF,"2Q4_KurthBaseKey");
    ActionGiveItem(oKey,GetPCSpeaker());
    SetLocalInt(GetModule(),"Kurth_Key_Given",1);
    SetLocalInt(GetPCSpeaker(),"Met_Oreth",3);
    RewardXP("m2q4_Main",20,GetPCSpeaker());
}
