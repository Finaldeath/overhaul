int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"NW_RESC_PLOT_TOLD" + GetTag(OBJECT_SELF)) == 1 &&
               GetLocalInt(GetModule(),"NW_G_RESC_PLOT" + GetTag(OBJECT_SELF)) == 0;

    return iResult;
}
