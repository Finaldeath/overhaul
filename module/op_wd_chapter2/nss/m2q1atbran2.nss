void main()
{
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M2Q1ITSILPOTION"),GetPCSpeaker());
    SetLocalInt(GetModule(),"M2Q1BranCured",1);
    // * Drink Potion

    effect eVis = EffectVisualEffect(VFX_IMP_REMOVE_CONDITION);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis,OBJECT_SELF);
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING02"),GetPCSpeaker());
    DelayCommand(2.0,ActionStartConversation(GetLastSpeaker()));
}

