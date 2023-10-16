int StartingConditional()
{
    int iJob1 = GetLocalInt(OBJECT_SELF,"NW_ASSA_DOUBLE_CROSS");
    if (iJob1 == 1)
    {
        object oVictim = GetObjectByTag("AssassinGEN1");
        int iJob2 = GetLocalInt(GetPCSpeaker(),"NW_ASSA_DOUBLE_CROSS");
        if ((!GetIsObjectValid(oVictim)) && (iJob2 == 1))
        {
            return TRUE;
        }
    }
    return FALSE;
}
