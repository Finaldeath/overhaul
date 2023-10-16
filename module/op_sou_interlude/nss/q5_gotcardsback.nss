// if Daschnaya got her cards back in Chapter 1

int StartingConditional()
{
    int iResult;

    iResult = ((GetCampaignInt("Daschnaya", "Daschnaya_Got_Cards", GetPCSpeaker()) == 1) &&
               (GetLocalInt(OBJECT_SELF, "q5_Katriana_Reward") == 0));
    return iResult;
}
