// Deekin now calls the PC by their name

void main()
{
    string sCall1 = GetName(GetPCSpeaker());
    string sCall = (GetStringByStrRef(40564)) + sCall1;
    SetCampaignString("Deekin", "q6_Deekin_Call" + GetName(GetPCSpeaker()), sCall, GetPCSpeaker());
    SetCustomToken(1001, sCall);
}
