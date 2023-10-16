// this determines what Deekin is going to call the PC

void main()
{
    string sCall = GetCampaignString("Deekin", "q6_Deekin_Call" + GetName(GetPCSpeaker()), GetPCSpeaker());

    if (sCall == "")
    {
        SetCustomToken(1001, GetStringByStrRef(40571));
    }
    else SetCustomToken(1001, sCall);
}
