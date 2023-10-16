int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bCondition = GetLocalInt(oPC,"NW_L_M1S3Tests") == 10 &&
                     GetIsObjectValid(GetItemPossessedBy(oPC,"M1S03ICLAY")) &&
                     GetIsObjectValid(GetItemPossessedBy(oPC,"M1S03IFLASK")) &&
                     GetIsObjectValid(GetItemPossessedBy(oPC,"M1S03IKINDLING")) &&
                     GetIsObjectValid(GetItemPossessedBy(oPC,"M1S03IFOG"));
    return bCondition;
}

