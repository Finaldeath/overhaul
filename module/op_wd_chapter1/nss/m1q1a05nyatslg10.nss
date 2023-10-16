void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M1S5MainPlot") < 10)
    {
        SetLocalInt(GetModule(),"NW_G_M1S5MainPlot",10);
    }
    SetLocalInt(OBJECT_SELF,"L_TALKTIMES",GetLocalInt(OBJECT_SELF,"L_TALKTIMES") + 1);
}
