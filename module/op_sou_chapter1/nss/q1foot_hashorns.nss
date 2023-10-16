// if the PC has the Hart's Horns
// and has been told Ferran's story

int StartingConditional()
{
    int nPlot = GetLocalInt(GetPCSpeaker(), "q1foot_Ferran_Hunt");
    object nHorns = GetItemPossessedBy(GetPCSpeaker(), "q1foot_horns");
    if ((GetIsObjectValid(nHorns)) && (nPlot == 1))
    {
        return TRUE;
    }
    return FALSE;
}
