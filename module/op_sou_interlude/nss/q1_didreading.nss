// if Daschnaya did a reading for the PC in Chapter 1
// and the PC has not been told yet what she can do

int StartingConditional()
{
    int iResult;

    iResult = ((GetCampaignInt("Daschnaya", "Daschnaya_Did_Reading", GetPCSpeaker()) == 1) &&
              (GetLocalInt(GetPCSpeaker(), "q1_Know_Daschnaya") == 0));
    return iResult;
}
