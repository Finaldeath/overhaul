void main()
{
    CreateItemOnObject("M1S1LETTER",GetPCSpeaker());
    SetLocalObject(OBJECT_SELF,"NW_L_M1S1LetterGiven",GetPCSpeaker());
    SetCustomToken(701,GetName(GetPCSpeaker()));
}
