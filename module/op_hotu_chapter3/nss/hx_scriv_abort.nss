// Scriv abort.
void main()
{
    if(GetLocalInt(GetModule(), "bScrivenerQuestComplete") == TRUE)
    {
        SetLocalInt(GetModule(), "HX_SCRIV_CUT_DONE", TRUE);
    }
}
