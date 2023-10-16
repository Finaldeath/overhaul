// if Daschnaya got her cards back in Chapter 1

int StartingConditional()
{
    int iResult;

    iResult = GetCampaignInt("Daschnaya", "Daschnaya_Has_Cards", GetPCSpeaker()) == 1;
    return iResult;
}
