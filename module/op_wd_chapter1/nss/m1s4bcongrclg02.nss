int StartingConditional()
{
    object oLastFought = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_M1S4BLastFought");
    if(GetIsPC(GetPCSpeaker()))
        oLastFought = GetPCSpeaker();
    return GetIsObjectValid(GetItemPossessedBy(oLastFought,"M1S04IBADGELVL02"))&&
           GetLocalInt(oLastFought,"NW_L_M1S4Won");
}

