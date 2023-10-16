void main()
{
    SetLocalInt(GetModule(),"NW_G_M1S1QuillReturned",TRUE);
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1S1Quill"));

}

