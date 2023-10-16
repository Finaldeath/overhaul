int StartingConditional()
{
    return GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S3Fetish")) ||
            GetLevelByClass(CLASS_TYPE_RANGER,GetPCSpeaker()) > 0 ||
            GetLevelByClass(CLASS_TYPE_DRUID,GetPCSpeaker()) > 0;
}
