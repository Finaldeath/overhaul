void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M1Q2MainPlot") < 100)
    {
        ActionMoveToObject(GetNearestObjectByTag("WP_Return_" + GetTag(OBJECT_SELF)));
    }
}
