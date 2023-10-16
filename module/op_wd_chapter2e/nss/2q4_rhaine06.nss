#include "nw_i0_plot"

void main()
{
    object oKey = GetItemPossessedBy(OBJECT_SELF,"2Q4_BaramBaseKey");
    ActionGiveItem(oKey,GetPCSpeaker());
    SetLocalInt(GetModule(),"Baram_Key_Given",1);
    SetLocalInt(GetPCSpeaker(),"Met_Rhaine",3);
    RewardXP("m2q4_Main",20,GetPCSpeaker());
}
