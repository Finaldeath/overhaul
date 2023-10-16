void main()
{
    int nAmount = (GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") / 25) + 1;
    SetLocalInt(OBJECT_SELF,"L_TALKTIMES", nAmount);
}
