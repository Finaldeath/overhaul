// Deekin now calls the PC by their gender

void main()
{
    string sCall;
    int nSex = GetGender(GetPCSpeaker());
    if (nSex == GENDER_FEMALE)
    {
        sCall = GetStringByStrRef(4931);
    }
    else
    {
        sCall = GetStringByStrRef(4930);
    }
    SetCampaignString("Deekin", "q6_Deekin_Call" + GetName(GetPCSpeaker()), sCall, GetPCSpeaker());
    SetCustomToken(1001, sCall);
}
