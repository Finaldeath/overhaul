int StartingConditional()
{
    return GetLocalInt(GetPCSpeaker(),"NW_L_M1S3Tests") > 0 &&
            GetLocalInt(GetPCSpeaker(),"NW_L_M1S3Tests") <= 30;
}
