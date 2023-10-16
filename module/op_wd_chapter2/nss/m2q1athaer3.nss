// * Take Stirge's Ear

void main()
{
    SetLocalInt(GetModule(),"STIRGE_PLOT_DONE",1);
    SetLocalInt(OBJECT_SELF,"Num_Ears_Collected",GetLocalInt(OBJECT_SELF,"Num_Ears_Collected") + 1);
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M2Q03ISTIRGEEAR"),GetPCSpeaker());
}
