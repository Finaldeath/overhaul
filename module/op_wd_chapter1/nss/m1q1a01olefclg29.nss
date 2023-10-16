int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S1Quill")) &&
                     GetLocalInt(GetModule(),"NW_G_M1S1QuillReturned") == FALSE;
    return bCondition;
}
