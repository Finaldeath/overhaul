int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_M1S4BarOwner")) &&
                     GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S04IBADGELVL04")) == FALSE;

    return bCondition;
}
