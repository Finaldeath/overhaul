int StartingConditional()
{
    int iKey = GetLocalInt(GetModule(),"Kurth_Key_Given");
    object oKey = GetItemPossessedBy(OBJECT_SELF,"2Q4_KurthBaseKey");
    if ((iKey == 0) && (GetIsObjectValid(oKey)))
    {
        return TRUE;
    }
    return FALSE;
}
