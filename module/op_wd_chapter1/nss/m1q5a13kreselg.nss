void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M1Q5PlotSCB") < 10)
    {
        SetLocalInt(GetModule(),"NW_G_M1Q5PlotSCB",10);
    }
}
