int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") > 2 ||
              GetLocalInt(GetModule(),"NW_G_M3Q02PLOTPLAGUEPLOT") ==1;

    return iResult;
}
