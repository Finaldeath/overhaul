int StartingConditional()
{
    int l_iResult;

        l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES")==2 && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTUTHGARDTELKTRIBE") ==99;
    return l_iResult;
}


