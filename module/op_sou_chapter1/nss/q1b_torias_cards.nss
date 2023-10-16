// checks to see if the PC has Daschnaya's cards
// and whether the player has heard anything about the plot at all

int StartingConditional()
{
    object nCards = GetItemPossessedBy(GetPCSpeaker(), "q1bcards");
    int nPlot = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1bhalfling");

    if (GetIsObjectValid(nCards) && (nPlot > 0))
        return TRUE;
    return FALSE;
}
