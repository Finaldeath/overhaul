void main()
{
    SetLocalInt(GetPCSpeaker(),"Working_For_Kurth",0);
    SetLocalInt(GetPCSpeaker(),"Kurth_Gold_Reward",0);
    int iPlot = GetLocalInt(GetPCSpeaker(),"PCEvaine_Plot");
    if (iPlot == 5)
    {
        SetLocalInt(GetPCSpeaker(),"PCEvaine_Plot",6);
    }
}
