// Baram knows about Kurth's offer and is not willing to negotiate

void main()
{
    SetLocalInt(GetPCSpeaker(),"Working_For_Baram",3);
    SetLocalInt(GetPCSpeaker(),"Baram_Gold_Reward",0);
    int iPlot = GetLocalInt(GetModule(),"Londa_Plot");
    if ((iPlot == 10) || (iPlot == 15))
    {
        SetLocalInt(GetModule(),"Londa_Plot",16);
    }
}
