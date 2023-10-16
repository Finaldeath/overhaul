// * Take Wyvern's Ear

void main()
{
    SetLocalInt(GetModule(),"WYVERN_PLOT_DONE",1);
    SetLocalInt(OBJECT_SELF,"Num_Ears_Collected",GetLocalInt(OBJECT_SELF,"Num_Ears_Collected") + 1);
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M2Q02IWYVERNEAR"),GetPCSpeaker());
}
