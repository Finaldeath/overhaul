int StartingConditional()
{
    int iGender = GetGender(GetPCSpeaker());
    object oRomance = GetLocalObject(OBJECT_SELF,"Chapter2_Aribeth_Romance");
    if ((iGender == GENDER_MALE) && (!GetIsObjectValid(oRomance)))
    {
        return TRUE;
    }
    return FALSE;
}
