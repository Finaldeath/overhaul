// if Daschnaya got her cards back & the player has been told she can advise

int StartingConditional()
{
    int iResult;

    iResult = ((GetCampaignInt("Daschnaya", "Daschnaya_Has_Cards", GetPCSpeaker()) == 1) &&
              (GetLocalInt(GetPCSpeaker(), "q1_Know_Daschnaya") == 1) &&
              (GetLocalInt(OBJECT_SELF, "q1_Gave_Advice") == 0));
    return iResult;
}
