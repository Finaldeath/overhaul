#include "nw_i0_plot"

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_M2Q5Contest") < 10)
    {
        SetLocalObject(GetModule(),"NW_G_M2Q5ContestPC",GetPCSpeaker());
        SetLocalInt(GetModule(),"NW_G_M2Q5Contest",10);
        RewardXP("m2q5_Mutamin",25, GetPCSpeaker());
        AddJournalQuestEntry("m2q5_Mutamin",45,GetPCSpeaker());
    }
    SetLocalObject(GetArea(OBJECT_SELF),"NW_A_TRANSPORT_PC",GetPCSpeaker());
    SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(500));
}
