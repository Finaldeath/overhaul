#include "NW_I0_PLOT"

void main()
{
    int iPlot = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYc2_Aarin");
    PlayCharacterTheme(53);
    SetLocalInt(OBJECT_SELF,"Aarin_Told_Luskan",1);

    // * June 27 2002:
    // * Brent: Making the gates open at this point
    SetLocalInt(GetModule(),"Luskan_Gate_Open",1);
    if ((iPlot > 0) && (iPlot < 35))
    {
        AddJournalQuestEntry("c2_Aarin", 50, GetPCSpeaker(), FALSE);
    }
}
