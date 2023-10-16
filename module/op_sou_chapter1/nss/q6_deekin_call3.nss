// Deekin now calls the PC by their gender

void main()
{
    string sCall;
    int nSex = GetGender(GetPCSpeaker());
    if (nSex == GENDER_FEMALE)
    {
        sCall = GetStringByStrRef(4888);
    }
    else sCall = GetStringByStrRef(4928);

    string sCall1 = (GetStringByStrRef(40569)) + sCall;

    SetCampaignString("Deekin", "q6_Deekin_Call" + GetName(GetPCSpeaker()), sCall1, GetPCSpeaker());
    SetCustomToken(1001, sCall1);
}
