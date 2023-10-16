int StartingConditional()
{
    int iKey = GetLocalInt(GetModule(),"Baram_Key_Given");
    object oKey = GetItemPossessedBy(OBJECT_SELF,"2Q4_BaramBaseKey");
    if ((iKey == 0) && (GetIsObjectValid(oKey)))
    {
        return TRUE;
    }
    return FALSE;
}
