int StartingConditional()
{
    object oLastFought = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_M1S4BLastFought");
    if(GetIsPC(GetPCSpeaker()))
        oLastFought = GetPCSpeaker();
    ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1);
    return GetIsObjectValid(GetItemPossessedBy(oLastFought,"M1S04IBADGELVL04"));

}

