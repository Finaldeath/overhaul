int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalObject(GetModule(),"NW_G_M3Q01A01TRIALLAWYER") == GetPCSpeaker() && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTVERDICT") >3;
    return l_iResult;
}


