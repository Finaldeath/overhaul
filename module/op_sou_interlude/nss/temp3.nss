void main()
{
    int n = GetCampaignInt("dbItems", "Q3B_POWERSTONE_OFF");
    n++;
    if(n >= 7) n = 1;
    SpeakString("BOOM: " + IntToString(n));
    SetCampaignInt("dbItems", "Q3B_POWERSTONE_OFF", n);
}
