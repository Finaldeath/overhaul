int StartingConditional()
{
    int bCondition = !GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL01")) &&
                     !GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL02")) &&
                     !GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL03")) &&
                     !GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL04")) &&
                     GetLocalInt(GetModule(),"NW_G_Map_M1S4C_Occupied") == 1;
    return bCondition;
}
